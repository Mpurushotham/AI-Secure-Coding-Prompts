# AI Secure Coding Prompts

**A copy-paste prompt library that makes any AI coding assistant write secure code by default.**

AI assistants do not write secure code unless you make them. Each prompt in this library encodes framework-specific security rules, forbidden patterns, and verification checklists so that secure code is the *default* output — not something you bolt on in review.

Works with **any** AI agent or LLM: Claude / Claude Code, ChatGPT, GitHub Copilot, Cursor, Windsurf, Gemini, and local models.

---

## How to use this library

1. **Find your stack** in the index below and open the prompt file.
2. **Copy the entire prompt block** (the fenced `text` block) into your AI assistant *before* you ask it to write or review code — as a system prompt, a rules file (`CLAUDE.md`, `.cursorrules`, `copilot-instructions.md`), or simply the first message of the session.
3. **Then give it your real task** ("build a file-upload endpoint", "review this PR", "write the Terraform for our VPC"). The security requirements stay active for the whole session.
4. **Stack prompts** when a task spans domains — e.g. combine `python.md` + `sql-injection-prevention.md` + `jwt-security.md` for a Flask API with JWT auth.

Every prompt follows the same contract:

- **Role & scope** — who the AI is acting as and what code the rules apply to
- **Hard requirements** — numbered, specific, framework-native controls (real APIs, real config keys)
- **Forbidden patterns** — things the AI must never emit, even if asked casually
- **Verification** — a self-check the AI runs before returning code
- **Escape hatch** — if a requirement can't be met, the AI must say so explicitly instead of silently degrading security

Standards referenced throughout: OWASP Top 10 (2021), OWASP ASVS 5.0, OWASP API Security Top 10 (2023), OWASP MASVS, OWASP Top 10 for LLM Applications, OWASP Agentic AI Top 10, CWE Top 25, NIST SP 800-63B / 800-57 / 800-190, CIS Benchmarks, SLSA.

---

## Index

### 01 · Backend Frameworks — [`01-backend-frameworks/`](01-backend-frameworks/)

| Prompt | Covers |
|---|---|
| [.NET](01-backend-frameworks/dotnet.md) | ASP.NET Core, Entity Framework Core |
| [Elixir](01-backend-frameworks/elixir-phoenix.md) | Phoenix, Ecto |
| [Go](01-backend-frameworks/go.md) | Core stdlib, Echo, Gin |
| [Graph Databases](01-backend-frameworks/graph-databases.md) | Neo4j/Cypher, Gremlin |
| [GraphQL](01-backend-frameworks/graphql.md) | Apollo, graphql-js, Absinthe, Graphene |
| [gRPC](01-backend-frameworks/grpc.md) | mTLS, interceptors, protobuf hygiene |
| [Java](01-backend-frameworks/java.md) | Core, Spring Boot, Spring MVC, Hibernate |
| [Message Brokers](01-backend-frameworks/message-brokers.md) | Kafka, RabbitMQ |
| [Node.js](01-backend-frameworks/nodejs.md) | Express, NestJS, Next.js API routes, Fastify |
| [NoSQL](01-backend-frameworks/nosql.md) | MongoDB, Redis, Cassandra, Elasticsearch |
| [PHP](01-backend-frameworks/php.md) | Core, Laravel, Symfony |
| [Python](01-backend-frameworks/python.md) | Core, Flask, FastAPI, SQLAlchemy, PySpark |
| [RDBMS](01-backend-frameworks/rdbms.md) | PostgreSQL, MySQL, Oracle, SQL Server |
| [Ruby](01-backend-frameworks/ruby.md) | Rails, Sinatra |
| [Rust](01-backend-frameworks/rust.md) | Core, Axum, Actix Web, async runtimes |
| [Scala](01-backend-frameworks/scala.md) | Play, Akka |
| [ServiceNow](01-backend-frameworks/servicenow.md) | Glide scripting, ACLs, scoped apps |
| [Swift Server](01-backend-frameworks/swift-vapor.md) | Vapor |
| [Unity](01-backend-frameworks/unity.md) | Game client/server trust, asset & save integrity |

### 02 · Client-Side Frameworks — [`02-client-side-frameworks/`](02-client-side-frameworks/)

| Prompt | Covers |
|---|---|
| [Alpine.js](02-client-side-frameworks/alpinejs.md) | x-html risks, CSP-compatible builds |
| [Angular](02-client-side-frameworks/angular.md) | DomSanitizer, template injection, route guards |
| [Astro](02-client-side-frameworks/astro.md) | set:html, islands, SSR endpoints |
| [Deno Fresh](02-client-side-frameworks/deno-fresh.md) | Islands, permissions model |
| [Ember.js](02-client-side-frameworks/emberjs.md) | htmlSafe, template escaping |
| [Flutter Desktop](02-client-side-frameworks/flutter-desktop.md) | Platform channels, local storage |
| [HTMX](02-client-side-frameworks/htmx.md) | Server-rendered partials, hx-* injection |
| [JavaScript](02-client-side-frameworks/javascript.md) | Vanilla DOM security, prototype pollution |
| [jQuery](02-client-side-frameworks/jquery.md) | $() injection sinks, legacy hardening |
| [Lit](02-client-side-frameworks/lit.md) | unsafeHTML, template bindings |
| [Next.js](02-client-side-frameworks/nextjs.md) | Server components, server actions, middleware |
| [Preact](02-client-side-frameworks/preact.md) | dangerouslySetInnerHTML, compat pitfalls |
| [Qwik](02-client-side-frameworks/qwik.md) | Serialization boundaries, server$ |
| [React](02-client-side-frameworks/react.md) | JS/TS, Redux, XSS sinks, state security |
| [SolidJS](02-client-side-frameworks/solidjs.md) | innerHTML bindings, SSR escaping |
| [Svelte](02-client-side-frameworks/svelte.md) | {@html}, SvelteKit load/actions |
| [TypeScript](02-client-side-frameworks/typescript.md) | Type-level trust boundaries, validation |
| [Vue.js](02-client-side-frameworks/vuejs.md) | v-html, template compilation, Pinia |

### 03 · Web & API Security — [`03-web-api-security/`](03-web-api-security/)

| Prompt | Covers |
|---|---|
| [API Security & Rate Limiting](03-web-api-security/api-security-rate-limiting.md) | OWASP API Top 10, throttling, quotas |
| [API Key Management](03-web-api-security/api-key-management.md) | Issuance, rotation, scoping, storage |
| [Content Security Policy](03-web-api-security/content-security-policy.md) | Nonce/hash CSP, strict-dynamic |
| [CORS](03-web-api-security/cors.md) | Origin allow-lists, credentials mode |
| [CSRF Prevention](03-web-api-security/csrf-prevention.md) | Tokens, SameSite, double-submit |
| [Database Encryption](03-web-api-security/database-encryption.md) | At-rest, field-level, TDE, key rotation |
| [File Upload Security](03-web-api-security/file-upload-security.md) | Validation, storage, AV, image processing |
| [JWT Security](03-web-api-security/jwt-security.md) | alg confusion, validation, revocation |
| [OpenAPI Validation](03-web-api-security/openapi-validation.md) | Schema-first request/response validation |
| [Server-Side Web App Security](03-web-api-security/server-side-web-security.md) | Headers, redirects, error handling |
| [SQL Injection Prevention](03-web-api-security/sql-injection-prevention.md) | Parameterization across all languages |
| [SSRF Prevention](03-web-api-security/ssrf-prevention.md) | URL validation, egress control, metadata |
| [tRPC Security](03-web-api-security/trpc-security.md) | Procedures, middleware, input schemas |
| [Webhook Security](03-web-api-security/webhook-security.md) | Signing, replay defense, idempotency |
| [WebSocket Security](03-web-api-security/websocket-security.md) | Origin checks, auth, message validation |
| [XSS Prevention](03-web-api-security/xss-prevention.md) | Contextual encoding, sanitization |
| [XXE Prevention](03-web-api-security/xxe-prevention.md) | Safe XML parsing in every language |

### 04 · Authentication — [`04-authentication/`](04-authentication/)

| Prompt | Covers |
|---|---|
| [Password Storage](04-authentication/password-storage.md) | Argon2id, bcrypt, scrypt, migration |
| [Multi-Factor Authentication](04-authentication/multi-factor-authentication.md) | TOTP, WebAuthn, recovery codes |
| [Session Management](04-authentication/session-management.md) | Cookies, rotation, fixation, timeout |
| [Account Recovery](04-authentication/account-recovery.md) | Reset tokens, enumeration defense |
| [Credential Stuffing Defense](04-authentication/credential-stuffing-defense.md) | Rate limits, breach lists, device signals |
| [Single Sign-On](04-authentication/single-sign-on.md) | SAML, OIDC, assertion validation |
| [Passwordless Authentication](04-authentication/passwordless-authentication.md) | Passkeys/WebAuthn, magic links |

### 05 · Authorization — [`05-authorization/`](05-authorization/)

| Prompt | Covers |
|---|---|
| [Open Policy Agent](05-authorization/open-policy-agent.md) | Rego policy design, bundle integrity |
| [RBAC Architect](05-authorization/rbac-architect.md) | Role modeling, deny-by-default |
| [ABAC Architect](05-authorization/abac-architect.md) | Attribute policies, policy engines |
| [ReBAC Architect](05-authorization/rebac-architect.md) | Relationship graphs, Zanzibar model |
| [OpenFGA](05-authorization/openfga.md) | Authorization models, contextual tuples |
| [SpiceDB](05-authorization/spicedb.md) | Schema design, caveats, consistency |
| [Casbin](05-authorization/casbin.md) | Model/policy files, enforcement points |
| [Cedar Policy](05-authorization/cedar-policy.md) | AWS Cedar / Verified Permissions |

### 06 · Cryptography — [`06-cryptography/`](06-cryptography/)

| Prompt | Covers |
|---|---|
| [Symmetric Encryption](06-cryptography/symmetric-encryption.md) | AES-GCM, ChaCha20-Poly1305, nonces |
| [Asymmetric Encryption](06-cryptography/asymmetric-encryption.md) | RSA-OAEP, ECDH, signatures, hybrid |
| [Password Hashing](06-cryptography/password-hashing.md) | KDF selection and parameters |
| [TLS Configuration](06-cryptography/tls-configuration.md) | 1.2/1.3, ciphers, cert validation |
| [Key Management](06-cryptography/key-management.md) | Lifecycle, rotation, envelope encryption |
| [Secure Random](06-cryptography/secure-random-number-generation.md) | CSPRNGs per language, token generation |

### 07 · AI & Agentic Security — [`07-ai-agentic-security/`](07-ai-agentic-security/)

| Prompt | Covers |
|---|---|
| [Agentic AI Security](07-ai-agentic-security/agentic-ai-security.md) | OWASP Agentic Top 10, tool sandboxing |
| [MCP Server Security](07-ai-agentic-security/mcp-server-security.md) | Tool poisoning defense, MCP hardening |
| [AI Agent Frameworks](07-ai-agentic-security/ai-agent-frameworks.md) | LangChain, CrewAI, AutoGen, LlamaIndex, Claude SDK |
| [AI Agent Identity & Access](07-ai-agentic-security/ai-agent-identity-access-management.md) | Agent credentials, scoped delegation |
| [AI Governance & EU AI Act](07-ai-agentic-security/ai-governance-eu-ai-act.md) | Risk classification, compliance controls |
| [AI Supply Chain & Model Integrity](07-ai-agentic-security/ai-supply-chain-model-integrity.md) | Model provenance, safetensors, registries |
| [RAG Pipeline Security](07-ai-agentic-security/rag-pipeline-security.md) | Indirect injection, doc-level ACLs |

### 08 · Infrastructure & DevSecOps — [`08-infrastructure-devsecops/`](08-infrastructure-devsecops/)

| Prompt | Covers |
|---|---|
| [Ansible](08-infrastructure-devsecops/ansible.md) | Vault, no_log, privilege escalation |
| [AWS CloudFormation & CDK](08-infrastructure-devsecops/aws-cloudformation-cdk.md) | Guard rails, cdk-nag, IAM synthesis |
| [CI/CD Pipelines](08-infrastructure-devsecops/cicd-pipelines.md) | Pipeline poisoning, artifact integrity |
| [Cloud Security](08-infrastructure-devsecops/cloud-security-aws-azure.md) | AWS & Azure account/IAM baselines |
| [Docker & Containers](08-infrastructure-devsecops/docker-containers.md) | Dockerfile hardening, image pipelines |
| [GitHub Actions](08-infrastructure-devsecops/github-actions.md) | Workflow injection, OIDC, pinning |
| [GitLab CI](08-infrastructure-devsecops/gitlab-ci.md) | Runner security, protected branches |
| [HAProxy](08-infrastructure-devsecops/haproxy.md) | TLS termination, header hygiene, ACLs |
| [Kubernetes](08-infrastructure-devsecops/kubernetes.md) | NetworkPolicy, admission control, PSS |
| [Monitoring & Observability](08-infrastructure-devsecops/monitoring-observability.md) | Log hygiene, audit trails, alerting |
| [Nginx](08-infrastructure-devsecops/nginx.md) | TLS, headers, proxy security |
| [OAuth2 / OIDC](08-infrastructure-devsecops/oauth2-oidc.md) | Okta, Auth0, IdentityServer flows |
| [Pulumi](08-infrastructure-devsecops/pulumi.md) | Secrets, policy as code, state |
| [Service Mesh](08-infrastructure-devsecops/service-mesh.md) | Istio, Linkerd, mTLS, authz policies |
| [Serverless](08-infrastructure-devsecops/serverless.md) | Lambda, Azure Functions, GCP Functions |
| [Terraform](08-infrastructure-devsecops/terraform.md) | AWS/Azure/GCP modules, state security |
| [WAF](08-infrastructure-devsecops/waf.md) | AWS WAF, ModSecurity, Cloudflare |

### 09 · Secrets Management — [`09-secrets-management/`](09-secrets-management/)

| Prompt | Covers |
|---|---|
| [HashiCorp Vault](09-secrets-management/hashicorp-vault.md) | Auth methods, policies, dynamic secrets |
| [AWS Secrets Manager / KMS](09-secrets-management/aws-secrets-manager-kms.md) | Rotation, resource policies, envelope |
| [Azure Key Vault](09-secrets-management/azure-key-vault.md) | RBAC, managed identity, soft delete |
| [GCP Secret Manager / Cloud KMS](09-secrets-management/gcp-secret-manager-kms.md) | IAM, CMEK, rotation |
| [Kubernetes Secrets & ESO](09-secrets-management/kubernetes-secrets-eso.md) | External Secrets Operator, etcd encryption |
| [1Password Secrets Automation](09-secrets-management/1password-secrets-automation.md) | Connect, service accounts, op CLI |
| [CyberArk Conjur](09-secrets-management/cyberark-conjur.md) | Policy as code, host identities |
| [Docker Secrets](09-secrets-management/docker-secrets.md) | Swarm/BuildKit secrets, image hygiene |
| [Doppler](09-secrets-management/doppler.md) | Projects, configs, service tokens |
| [GitHub Actions Secrets](09-secrets-management/github-actions-secrets.md) | Environments, OIDC federation |
| [Infisical](09-secrets-management/infisical.md) | Machine identities, secret scanning |
| [Mozilla SOPS](09-secrets-management/mozilla-sops.md) | age/KMS encryption, git workflows |
| [Vercel Secrets](09-secrets-management/vercel-secrets.md) | Env vars, edge config, preview envs |

### 10 · Mobile — [`10-mobile/`](10-mobile/)

| Prompt | Covers |
|---|---|
| [Android](10-mobile/android.md) | Keystore, IPC, WebView, storage |
| [iOS (Swift)](10-mobile/ios-swift.md) | Keychain, ATS, biometrics, universal links |
| [React Native](10-mobile/react-native.md) | Bridge security, storage, Hermes |
| [Flutter](10-mobile/flutter.md) | Platform channels, secure storage |
| [Kotlin Multiplatform](10-mobile/kotlin-multiplatform.md) | Shared code trust boundaries |
| [Electron Desktop](10-mobile/electron-desktop.md) | contextIsolation, IPC, nodeIntegration |
| [Mobile Supply Chain & Release](10-mobile/mobile-supply-chain-release.md) | Signing, store hardening, SDK vetting |
| [Mobile Data Protection & Privacy](10-mobile/mobile-data-protection-privacy.md) | PII handling, consent, telemetry |

### 11 · Systems, Embedded & IoT — [`11-systems-embedded-iot/`](11-systems-embedded-iot/)

| Prompt | Covers |
|---|---|
| [C](11-systems-embedded-iot/c.md) | Memory safety, banned APIs, CERT C |
| [C++](11-systems-embedded-iot/cpp.md) | RAII, bounds, modern C++ hardening |
| [Embedded C](11-systems-embedded-iot/embedded-c.md) | MISRA, stack limits, watchdogs |
| [FreeRTOS](11-systems-embedded-iot/freertos.md) | Task isolation, MPU, queue safety |
| [Zephyr RTOS](11-systems-embedded-iot/zephyr-rtos.md) | Kconfig hardening, userspace |
| [Embedded Linux](11-systems-embedded-iot/embedded-linux.md) | Yocto/Buildroot, secure boot, updates |
| [IoT Protocol Security](11-systems-embedded-iot/iot-protocol-security.md) | MQTT, CoAP, BLE, LoRaWAN |
| [IoT Cloud Security](11-systems-embedded-iot/iot-cloud-security.md) | Device identity, fleet provisioning |
| [Firmware Vulnerability Analysis](11-systems-embedded-iot/firmware-vulnerability-analysis.md) | Binary analysis, CVE triage (defensive) |

### 12 · WebAssembly — [`12-webassembly/`](12-webassembly/)

| Prompt | Covers |
|---|---|
| [Browser WASM](12-webassembly/browser-wasm-security.md) | JS↔WASM boundary, CSP, memory |
| [Server-Side WASM](12-webassembly/server-side-wasm-security.md) | WASI, Wasmtime/wasmer sandboxing |
| [WASM Cryptography](12-webassembly/wasm-cryptography.md) | Constant-time, key material in linear memory |
| [WASM Supply Chain](12-webassembly/wasm-supply-chain-security.md) | Module provenance, registries |
| [WASM Memory Safety](12-webassembly/wasm-memory-safety.md) | Linear memory, host bindings |

### 13 · Code Quality — [`13-code-quality/`](13-code-quality/)

| Prompt | Covers |
|---|---|
| [General Secure Coding Standards](13-code-quality/general-secure-coding-standards.md) | Language-agnostic baseline for any task |

### 14 · Cloud & Architecture — [`14-cloud-architecture/`](14-cloud-architecture/)

Design-time and cloud-platform prompts. Container, Kubernetes, Terraform/CDK/Pulumi, service mesh, WAF, serverless, and the combined AWS+Azure baseline live in [`08-infrastructure-devsecops/`](08-infrastructure-devsecops/); this category adds architecture-level and per-cloud depth.

| Prompt | Covers |
|---|---|
| [Architecture Diagrams](14-cloud-architecture/architecture-diagrams.md) | Security-annotated diagram-as-code, trust boundaries, gaps |
| [Threat Modeling](14-cloud-architecture/threat-modeling.md) | STRIDE, attack chains, prioritized controls |
| [Secure Reference Architectures](14-cloud-architecture/secure-reference-architectures.md) | 3-tier, microservices, event-driven, serverless, data, JAMstack |
| [AWS Security](14-cloud-architecture/aws-security.md) | Accounts, SCPs, IAM, KMS, S3, detection (deep dive) |
| [Azure Security](14-cloud-architecture/azure-security.md) | Entra ID, PIM, Policy, Key Vault, Defender (deep dive) |
| [GCP Security](14-cloud-architecture/gcp-security.md) | Org policy, IAM, VPC-SC, CMEK, SCC (deep dive) |
| [Multi-Cloud & Hybrid](14-cloud-architecture/multi-cloud-hybrid-security.md) | Federated identity, cross-cloud connectivity, uniform policy |
| [SaaS Multi-Tenancy](14-cloud-architecture/saas-multi-tenancy.md) | Tenant isolation, per-tenant data, onboarding/offboarding |
| [Cloud Networking](14-cloud-architecture/cloud-networking.md) | VPC/VNet segmentation, private endpoints, egress, DNS |
| [API Gateway & Management](14-cloud-architecture/api-gateway-management.md) | Edge authn, rate limits, backend protection, gateway policy |
| [Managed Services Hardening](14-cloud-architecture/managed-services-hardening.md) | Storage, DBs, queues, caches, warehouses across clouds |

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). New prompts must follow [PROMPT-TEMPLATE.md](PROMPT-TEMPLATE.md).

## Acknowledgements

Category taxonomy inspired by the [Manicode Security prompt library](https://manicode.com/ai/index.html) by Jim Manico. All prompt content in this repository is original.
