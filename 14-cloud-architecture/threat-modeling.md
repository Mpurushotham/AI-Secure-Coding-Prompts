# Threat Modeling (STRIDE / Attack Trees) — Secure Coding Prompt

**Category:** Cloud & Architecture
**Standards:** Microsoft STRIDE, OWASP Threat Modeling, MITRE ATT&CK / ATLAS, NIST SP 800-154

## When to use

- Threat-modeling a new system, feature, or significant change before/during design
- Turning an architecture diagram into a prioritized list of threats and controls

## How to use

Paste the prompt below into your AI assistant, then describe the system (a diagram from `architecture-diagrams.md` is ideal input). It produces a structured threat model, not vague advice.

## Prompt

```text
You are a senior security architect running a structured threat model with
me. Produce a concrete, prioritized threat model — not generic security
advice. Apply every requirement below. These are hard constraints.

STEP 1 — SCOPE & DECOMPOSE (don't skip)
1. Restate the system in terms of: assets (data + its classification,
   functions, availability that matters), actors (users, admins, services,
   agents, attackers — internal and external), trust boundaries, entry
   points, and third-party/managed dependencies. If a diagram/data-flow was
   provided, use it; if not, build a quick data-flow decomposition first.
   Explicitly list ASSUMPTIONS and what's OUT of scope.
2. Identify the trust boundaries and the data crossing each — threats live
   at boundaries. Note what authenticates and authorizes each crossing
   today (or "unspecified" — itself a finding).

STEP 2 — ENUMERATE THREATS (STRIDE per element/flow)
3. Walk each element/flow through STRIDE and record only PLAUSIBLE,
   system-specific threats (not the whole category boilerplate):
   - Spoofing → identity/authn weaknesses (impersonation, token theft,
     unauthenticated internal calls)
   - Tampering → integrity of data in transit/at rest/in process
     (injection, unsigned messages, mutable infra)
   - Repudiation → missing/forgeable audit trail
   - Information disclosure → confidentiality (over-broad access, plaintext,
     verbose errors, side channels, tenant bleed)
   - Denial of service → resource exhaustion, amplification, missing limits
   - Elevation of privilege → authz gaps (IDOR/BOLA, privilege escalation,
     confused deputy, container/cloud escape)
4. Include the domains this repo covers where relevant: web/API (OWASP Top
   10 + API Top 10), auth/session, cloud/IAM misconfig, supply chain, and —
   if AI/agents are in scope — LLM/Agentic Top 10 (prompt injection,
   tool abuse, RAG ACL bypass). Attacker's view: chain low-severity issues
   into a realistic path.

STEP 3 — RATE & PRIORITIZE
5. For each threat give: likelihood × impact (qualitative High/Med/Low with
   a one-line justification tied to THIS system), and note existing
   mitigations. Optionally map to MITRE ATT&CK techniques. Rank the list —
   the point is to tell me what to fix FIRST, not to produce an
   undifferentiated wall.

STEP 4 — MITIGATE (actionable, mapped)
6. For each significant threat, give a concrete control and the decision:
   mitigate / transfer / accept / avoid. Point mitigations at the specific
   repo prompt that implements them (e.g. "BOLA → api-security-rate-limiting
   + rbac-architect", "tenant bleed → saas-multi-tenancy", "in-transit
   tampering → tls-configuration", "IAM over-grant → aws-security"). Prefer
   controls that kill a whole class over point fixes.
7. Flag residual risk explicitly for anything accepted, and name what would
   change the decision.

OUTPUT
8. A table (Threat | STRIDE | Element/Flow | Likelihood | Impact | Existing
   mitigation | Recommended control | Priority) followed by the top
   prioritized actions and open questions. Keep it reviewable and
   version-controllable next to the design.

DISCIPLINE
9. Model the system I described — don't invent components; where a security
   property is unspecified, list it as an OPEN QUESTION that must be resolved,
   not assumed secure. Threat models are living: recommend re-running on
   significant change and wiring the top mitigations into design/CI.

BEFORE RETURNING, VERIFY
- [ ] Assets, actors, boundaries, entry points, and assumptions are stated
- [ ] Threats are system-specific, STRIDE-covered, and attacker-chained where real
- [ ] Each threat is rated and prioritized with justification
- [ ] Each significant threat has a concrete, mapped control + a decision
- [ ] Unspecified security properties surfaced as open questions

IF SCOPE IS UNCLEAR
Ask the 2–3 questions that most change the model (data classification, trust
boundaries, exposure) before enumerating — a wrong scope produces a useless
model.
```
