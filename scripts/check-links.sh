#!/usr/bin/env bash
#
# Verify every relative Markdown link in the repo resolves to a real file or
# directory. Skips external (http/https/mailto/tel) links and pure #anchors.
# Exits non-zero if any link is broken, so CI fails on a bad reference.
#
set -uo pipefail

broken_file="$(mktemp)"
checked=0

# All markdown files (portable across bash versions; handle spaces via -print0).
while IFS= read -r -d '' md; do
  dir="$(dirname "$md")"

  # Extract each ](target) occurrence, strip the wrapper to leave the target.
  while IFS= read -r target; do
    [ -z "$target" ] && continue

    case "$target" in
      http://*|https://*|mailto:*|tel:*|\#*) continue ;;
    esac

    # Drop any #anchor fragment; skip if nothing left.
    path="${target%%#*}"
    [ -z "$path" ] && continue

    checked=$((checked + 1))
    if [ ! -e "$dir/$path" ]; then
      echo "BROKEN: $md -> $target" | tee -a "$broken_file"
    fi
  done < <(grep -oE '\]\([^)]+\)' "$md" 2>/dev/null | sed -E 's/^\]\(//; s/\)$//')
done < <(find . -name '*.md' -not -path './.git/*' -print0)

count="$(wc -l < "$broken_file" | tr -d ' ')"
echo "Checked $checked relative Markdown links."
if [ "$count" -gt 0 ]; then
  echo "FAILED: $count broken link(s) found."
  rm -f "$broken_file"
  exit 1
fi

echo "OK: all relative links resolve."
rm -f "$broken_file"
