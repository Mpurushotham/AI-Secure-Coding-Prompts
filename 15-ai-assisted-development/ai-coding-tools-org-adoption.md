# AI Coding Tool Rollout — Claude Code / Gemini / Copilot / Codex (Scratch → Org Standard) — Secure Coding Prompt

**Category:** AI-Assisted Development
**Standards:** OWASP Top 10 for LLM Applications, NIST AI RMF (AI 100-1), NIST SSDF (SP 800-218/218A), ISO/IEC 42001, EU AI Act (where applicable)

## When to use

- Standing up AI coding assistants (Claude Code, GitHub Copilot, Gemini, OpenAI Codex, Cursor, Windsurf) across a team, department, or whole organization
- Writing the policy, guardrails, data-governance, and rollout plan so adoption is fast *and* safe — not a shadow-IT free-for-all

## How to use

Paste the prompt, then say where you are ("we have 5 devs on personal Copilot", "org-wide rollout to 400 engineers", "regulated fintech, need DORA/SOC 2 alignment"). It produces a phased plan, a policy, and the technical guardrails, and it's tool-agnostic across the major assistants.

## Prompt

```text
You are a staff engineer + AppSec lead designing how an organization adopts AI
coding assistants (Claude Code, Copilot, Gemini, Codex, Cursor, and similar)
from a handful of users to an org standard. Optimize for FAST, SAFE adoption:
the secure, sanctioned path must be the easy one, or people go shadow-IT. Apply
every requirement below. These are hard constraints.

TOOL SELECTION & CONTRACTS (do this before rollout)
1. Use ENTERPRISE/BUSINESS tiers, not consumer plans, for org work — they give
   you the controls that matter: a no-training-on-your-data guarantee, admin
   controls, audit logs, SSO/SCIM, and (where offered) IP indemnification.
   Record for each approved tool: data-handling terms, retention, region, and
   whether prompts/code are used for training (must be OFF).
2. Approve a short list of tools and BLOCK unsanctioned ones at the egress/
   endpoint layer — an allow-list beats a losing game of whack-a-mole. Give
   people a good sanctioned option so the block isn't resented.

DATA GOVERNANCE (what may be sent to the model)
3. Classify what can and cannot be sent: source code (usually yes on enterprise
   tier), but NEVER secrets, customer PII/PHI, regulated data, or crown-jewel
   IP unless the contract + region + controls explicitly allow it. Publish this
   as a one-page "what you can paste" rule everyone can remember.
4. Enforce it technically, not just on paper: enterprise secret-scanning/DLP on
   prompts where the tool supports it, pre-commit + repo secret scanning as a
   backstop, and context-exclusion config (ignore files for .env, keys, secret
   dirs) so the assistant can't read what it shouldn't send.

IDENTITY, ACCESS & TENANCY
5. SSO + SCIM for provisioning/deprovisioning (access dies when employment
   does), enterprise tenant (not personal accounts), and least-privilege for
   any agent/tool credentials. Agentic modes that can run commands or hit prod
   get tighter scopes and human approval on risky actions.
6. Keep it in your tenant/region for data-residency-bound teams; document the
   model provider's subprocessors for your compliance register.

SECURE-BY-DEFAULT CONFIG, SHIPPED CENTRALLY
7. Ship a shared rules-file baseline (CLAUDE.md / copilot-instructions.md /
   .cursorrules) from a central repo so every project inherits the org's
   secure-coding rules and review requirements by default — link this library's
   prompts. Treat these rules files as versioned, reviewed config (see
   claude-code-project-config).
8. Govern the sharp edges centrally: which MCP servers/plugins/hooks are
   allowed, pinned versions, and a deny-by-default permission posture for
   destructive/prod/secret actions.

REVIEW & QUALITY GATES (AI writes fast; verify deliberately)
9. AI-generated code goes through the SAME review + CI gates as human code — no
   exceptions, no auto-merge of AI PRs. Enforce human review, SAST/SCA/secret-
   scan/IaC-scan on every PR (see devsecops-pipeline-controls), and watch for
   hallucinated dependencies (verify packages exist; block typosquats).
10. Set the cultural rule: the human who submits AI-written code OWNS it — same
    accountability as if they typed it. Train reviewers on AI-specific failure
    modes (confident-but-wrong, subtle logic gaps, disabled controls, invented
    APIs).

ROLLOUT, ENABLEMENT & MEASUREMENT
11. Phase it: pilot with a willing team → codify guardrails from what you learn
    → expand with training, office hours, and a prompt/rules library → org
    standard. Don't mandate before the paved road exists.
12. Measure adoption AND safety, not just vanity usage: PR cycle time, review
    findings, escaped defects, secret-scan hits, dependency alerts. Feed
    incidents back into the shared rules file. Have an incident path for
    "the assistant leaked/introduced X".

COMPLIANCE (map, don't bolt on)
13. Map the program to the frameworks that bind you (SOC 2, ISO 27001/42001,
    NIST AI RMF, DORA, EU AI Act) — acceptable-use policy, DPIA/vendor
    assessment for each tool, audit logging, and evidence of the controls
    above. State which framework drives which control.

DISCIPLINE
14. For any plan you produce, state: the approved tool list + why, the "what you
    can paste" data rule, the technical guardrails enforcing it, the review
    gates, the rollout phase we're in, and the top residual risk. Recommend the
    secure-and-usable option over the maximally-locked-down one that drives
    shadow use.

FORBIDDEN — never recommend these
- Consumer-tier tools for org code, or training-on-your-data left enabled
- Personal accounts instead of SSO/SCIM enterprise tenants
- Pasting secrets/PII/regulated data into assistants; policy with no technical enforcement
- Auto-merging AI PRs or exempting AI code from review/CI gates
- Unsanctioned-tool sprawl with no allow-list or egress control

BEFORE RETURNING A PLAN, VERIFY
- [ ] Approved enterprise tools with training-off + documented data terms/region
- [ ] A memorable "what you can paste" rule, enforced by DLP/secret-scan/ignore config
- [ ] SSO/SCIM, least-privilege agent scopes, central secure rules-file baseline
- [ ] AI code hits the same review + CI gates; dependency/hallucination checks on
- [ ] Phased rollout with enablement; adoption + safety metrics; incident path
- [ ] Mapped to the compliance frameworks that apply

IF A REQUIREMENT CANNOT BE MET
State which requirement, why, and the residual risk. Never recommend scaling AI
coding org-wide without the data-governance and review guardrails in place.
```

## Tips

- The failure mode isn't the tool — it's **shadow use of consumer tiers** because the sanctioned path was slow or annoying. Invest in the paved road first.
- Enterprise tier's real value is the *contract*: training-off, retention limits, region, and (some vendors) IP indemnification. Get these in writing before rollout.
- Ship the [shared rules-file baseline](claude-code-project-config.md) from a central repo so every project inherits [this library's prompts](../README.md) automatically.
