# Contributing

Thanks for helping make this prompt library better. The goal is a set of
copy-paste prompts that measurably improve the security of AI-generated code.

## Principles

1. **Defensive only.** Every prompt hardens, detects, or remediates. Nothing
   whose primary purpose is enabling exploitation, evasion, or attacking
   systems the user doesn't own.
2. **Concrete beats comprehensive.** A rule an LLM can follow ("validate with
   a Zod `.strict()` schema at the route boundary") beats a principle it
   can't ("validate all input"). Name real APIs, config keys, and functions.
3. **Forbidden lists matter.** LLMs reproduce insecure idioms from training
   data. Explicitly banning them changes output — keep the `FORBIDDEN` and
   `BEFORE RETURNING CODE, VERIFY` sections sharp.
4. **One copy-paste block.** Users copy a single fenced `text` block. No
   placeholders that must be edited before first use; sensible defaults with
   `<angle-bracket>` slots only for genuinely tenant-specific values.
5. **Standards-mapped.** Cite OWASP/CWE/NIST in the file header so security
   teams can trace coverage. Keep the prompt body lean.

## Adding or editing a prompt

1. Copy [`PROMPT-TEMPLATE.md`](PROMPT-TEMPLATE.md) into the right category
   folder. Use a `kebab-case.md` filename matching the topic.
2. Fill in the header (category + standards), **When to use**, **How to use**,
   and the single **Prompt** block following the template's structure:
   role/scope → numbered requirements → forbidden list → verification
   checklist → escape hatch.
3. Add a row to the relevant table in [`README.md`](README.md).
4. Keep the tone identical to existing prompts: direct, imperative, addressed
   to the AI as a senior security engineer.

## Reviewing a prompt (checklist)

- [ ] Every requirement names a concrete API/config/pattern, not a vague goal
- [ ] The forbidden list captures the insecure idioms LLMs actually emit here
- [ ] Defaults are secure and work when pasted as-is
- [ ] Standards cited in the header are accurate
- [ ] No exploitation-enabling content; dual-use topics framed defensively
- [ ] Cross-references (`see the X prompt`) point to files that exist

## Scope

Requests for new categories or stacks are welcome — open an issue describing
the use case (which teams, what problem) before a large PR. The taxonomy
mirrors how engineering, product, and security teams actually divide work.

## Accuracy

Security guidance ages. If a recommendation is out of date (an algorithm
weakened, a default changed, a CVE class named), open a PR with the correction
and the reference. Prefer citing the primary source (OWASP cheat sheet, NIST
publication, vendor hardening guide) over blogs.
