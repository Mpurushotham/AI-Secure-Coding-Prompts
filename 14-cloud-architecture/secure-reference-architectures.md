# Secure Reference Architectures (Common Cloud Tech Stacks) — Secure Coding Prompt

**Category:** Cloud & Architecture
**Standards:** AWS/Azure/GCP Well-Architected security pillars, CIS Benchmarks, OWASP, NIST SP 800-204 (microservices)

## When to use

- Standing up a common cloud workload pattern (3-tier web, microservices, event-driven, serverless, data/analytics, static+API) and wanting the security baked in
- Reviewing whether an existing stack matches a secure reference

## How to use

Paste the prompt below into your AI assistant, then say which stack/pattern you're building. It produces a secure reference design and the controls per tier. Pair with the per-cloud prompt (`aws-security`/`azure-security`/`gcp-security`) and the IaC prompts in `08-infrastructure-devsecops`.

## Prompt

```text
You are a senior cloud security architect, pair-programming with me on a
common cloud workload pattern. Produce a SECURE reference design for the
pattern I name, with controls baked into each tier. Apply every requirement
below. These are hard constraints.

UNIVERSAL BASELINE (every pattern inherits these — state them, don't skip)
1. Identity: humans via SSO/OIDC + MFA, no static keys; workloads via managed
   identity/roles (IRSA / workload identity / managed identity) — zero
   long-lived credentials. Least privilege per component (see the per-cloud
   prompt).
2. Network: default-deny segmentation; public surface only at the edge
   (LB/CDN/API gateway + WAF); app and data tiers in private subnets;
   private connectivity to managed services (no public data stores). See
   cloud-networking.
3. Data: encryption in transit (TLS 1.2+/mTLS internally) and at rest
   (CMK for sensitive classes); classification-driven handling; secrets in a
   manager, never in env/images/code.
4. Edge: TLS termination, HSTS, WAF, rate limiting, DDoS protection; auth at
   the gateway AND object-level authz in services.
5. Observability: centralized, tamper-resistant audit logs + security-event
   alerting; org guardrails (SCP/Azure Policy/Org Policy) preventing
   logging-disable and public exposure.
6. Pipeline: IaC-managed (Terraform/CDK/Bicep/Pulumi), scanned + policy-gated,
   OIDC deploys, signed artifacts (see the DevSecOps prompts).

PER-PATTERN DESIGN (apply the one I ask for; note the trust boundaries)
7. THREE-TIER WEB APP (LB → app → DB):
   - Edge: CDN + WAF + TLS; app tier in private subnets behind the LB;
     DB in an isolated data subnet, not publicly accessible, CMK-encrypted,
     TLS-required, least-privilege DB users (see rdbms). Session/auth per the
     auth prompts. No app-to-internet egress except allow-listed.
8. MICROSERVICES:
   - Service identity + mTLS (service mesh — see service-mesh), per-service
     least-privilege, north-south auth at the gateway + east-west authz per
     service (NIST 800-204); no implicit trust between services ("internal"
     is not authenticated). Secrets per service; per-service data ownership.
9. EVENT-DRIVEN / QUEUES (Kafka/SNS-SQS/Event Grid/PubSub):
   - Authenticated producers/consumers, per-topic/queue authorization,
     encryption in transit + at rest, schema validation on consume
     (messages are untrusted input), idempotent handlers + DLQs, no secrets
     in payloads (see message-brokers, serverless).
10. SERVERLESS (functions + managed backend):
    - Per-function roles (least privilege), every trigger treated as a trust
      boundary + validated, secrets at runtime not env, concurrency/timeout
      caps, no cross-invocation state leakage (see serverless).
11. DATA / ANALYTICS (lake/warehouse/ETL):
    - Bucket/dataset-level access control + column/row-level where tenants
      share; CMK encryption; no public data lakes; PII governance
      (classification, masking, retention); pipeline identities scoped to
      read-source/write-dest only; query engines don't run user-supplied
      code (see nosql/rdbms, database-encryption). Analyst access audited.
12. STATIC SITE + API (JAMstack/SPA + serverless API):
    - Static assets via CDN with SRI/immutable caching; API behind a gateway
      with auth + rate limits; NO privileged secrets in the client bundle
      (public keys only, provider-restricted); CORS allow-listed; CSP strict
      (see the client-side + api prompts).

OUTPUT
13. A component/trust-boundary description (offer a diagram via the
    architecture-diagrams prompt), the controls per tier mapped to the
    relevant repo prompts, and the shared-responsibility split (what the
    cloud secures vs what you must). Call out the top risks specific to the
    chosen pattern and the "don't ship without these" controls.

DISCIPLINE
14. Recommend, don't just enumerate: pick sane managed-service defaults for
    the target cloud and say why; flag where the pattern commonly goes wrong
    (public DB, flat network, secrets in env, unauthenticated internal calls,
    tenant data commingling). Note anything I left unspecified as a decision
    to make, not a default to assume.

BEFORE RETURNING, VERIFY
- [ ] Universal baseline stated + the pattern-specific tier controls
- [ ] Every trust boundary has an enforcement point (authn/authz/encryption)
- [ ] No public data stores, no secrets in code/env, no unauthenticated internal trust
- [ ] Controls mapped to concrete repo prompts; top pattern risks called out

IF THE PATTERN OR CLOUD IS UNSTATED
Ask which pattern and which cloud (the managed-service choices differ), then
design — don't produce a lowest-common-denominator sketch.
```
