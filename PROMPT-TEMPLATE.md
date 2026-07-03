# Prompt Template

Every prompt file in this library follows this structure. Copy this file to create a new prompt.

```markdown
# <Topic> — Secure Coding Prompt

**Category:** <category name>
**Standards:** <OWASP / CWE / NIST / CIS references this prompt enforces>

## When to use

- <Concrete situations: "generating any endpoint that accepts file uploads", "reviewing a PR that touches session handling">

## How to use

Paste the prompt below into your AI assistant before giving it your task — as a
system prompt, a rules file (`CLAUDE.md`, `.cursorrules`, `copilot-instructions.md`),
or the first message of the session. Then describe what you want built or reviewed.

## Prompt

​```text
You are a senior <domain> security engineer pair-programming with me. Apply every
requirement below to ALL code you generate, modify, or review in this session —
including "quick examples" and boilerplate. These are hard constraints, not advice.

SECURITY REQUIREMENTS
1. <Specific, framework-native control with real API/config names>
2. ...

FORBIDDEN — never emit these, even if I ask casually
- <Anti-pattern>
- ...

BEFORE RETURNING CODE, VERIFY
- [ ] <Self-check item>
- ...

IF A REQUIREMENT CANNOT BE MET
State explicitly which requirement is affected, why, and what the residual risk
is. Never silently weaken a control to make code compile or a demo work.
​```
```

## Authoring rules

1. **Be concrete.** Name real functions, config keys, headers, and library versions. "Validate input" is useless; "validate with a Zod schema at the route boundary, `.strict()`, before any business logic" is a rule an LLM can follow.
2. **Forbidden lists matter as much as requirements.** LLMs reproduce insecure idioms from training data; explicitly banning them (`eval`, `dangerouslySetInnerHTML`, `verify=False`, `MD5` for passwords) measurably changes output.
3. **Keep it in one fenced block.** Users copy one thing. No placeholders that require editing before first use — sensible defaults, with `<angle-bracket>` slots only where a value is genuinely tenant-specific.
4. **Map to standards.** Cite OWASP/CWE in the file header so security teams can trace coverage; keep the prompt body itself lean.
5. **Defensive only.** Prompts must harden, detect, and remediate. Nothing that primarily enables exploitation.
