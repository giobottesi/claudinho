# claudinho

**Smart agent setup for GitHub Copilot.** Scan your codebase + answer 5 questions → get a personalized AI assistant that understands your project.

> ⚠️ **Early Stage**: claudinho is in active development. The core system works, but features may change. It doesn't touch your actual code files—only creates `.github/` configuration, so you can safely commit for team shareability or keep local for testing.

## What is this?

Instead of generic Copilot context, `dev-agent` teaches your Copilot:
- ✅ Your tech stack, file organization, naming patterns
- ✅ What breaks in your codebase (known gotchas)
- ✅ External services you depend on
- ✅ Your debugging style + team jargon
- ✅ Week-1 onboarding knowledge

**Result**: Faster coding, better suggestions, shared knowledge.

---

## 5-Minute Quick Start

```bash
# 1. Copy into your repo
cp -r .github/ your-repo/.github/

# 2. Open your repo in VS Code
cd your-repo
code .

# 3. In Copilot Chat, run:
/setup-agent

# 4. Answer 5 quick questions

# Done ✓ Your Copilot now understands your project
```

See [Quick Start](docs/QUICK_START.md) for detailed walkthrough.

---

## What You Get

### 1. Smart Main Agent
Development assistant for your full feature lifecycle:
- Understands your code patterns & conventions
- Catches mistakes before you commit
- Suggests refactoring aligned with your style
- Delegates to specialists as needed

### 2. 5 Included Skills

Each skill is a specialized expert, invoked via `/skill-name`:

| Skill | Purpose |
|-------|---------|
| `/setup-agent` | Scan code + personalize in 5 min |
| `/data-analysis` | SQL queries, trends, anomalies, cohort analysis |
| `/explain` | Learn systems, deep dives, concepts |
| `/capture-learning` | Save patterns and insights for reuse |
| `/brag` | Document work with evidence for portfolios |

### 3. Zero Manual Setup

Code scanning auto-detects:
- Tech stack (Rails, React, Python, Node, Rust, etc.)
- File organization (models → services → tests)
- Naming patterns (Action+Noun vs getXXX)
- Build commands (npm, bin/rails, cargo, etc.)
- Main domains (what your system does)

You only answer **5 human questions** that code can't know. See [QUICK_START](docs/QUICK_START.md) for examples.

---

## Core Files to Copy

```bash
cp -r .github/ your-repo/
```

Then run in VS Code Copilot Chat

```
/setup-agent 
```

**Includes**: Main agent, 5 skills, profile templates, and setup template.

See [Installation](docs/INSTALLATION.md#2-copy-to-your-project) for detailed structure.

---

## Documentation

| Document | Purpose |
|----------|---------|
| [Quick Start](docs/QUICK_START.md) | < 5 min setup + the 5 questions |
| [Installation](docs/INSTALLATION.md) | Step-by-step guide + troubleshooting |
| [How It Works](docs/CONCEPTS.md) | File organization & concepts |
| [Curiosity](docs/CURIOSITY.md) | Design philosophy, comparisons, research, FAQ |

---

## For New Team Members

Instead of:
> "Here's our codebase, it has 150 files and some conventions..."

They:
1. Clone your repo
2. Run `/setup-agent`
3. Answer 5 questions (5 min)
4. **Copilot understands everything**

Productivity: **Week 1 vs Week 3.**

---

## How It Works (3 Phases)

### Phase 1: Code Scanning (Automatic)
Detects tech stack, file org, naming patterns, build commands, main domains from your code.

### Phase 2: 5 Personal Questions (5 min)
You answer what code can't know: gotchas, integrations, debugging style, jargon, week-1 knowledge.

### Phase 3: Auto-Generate
Creates `.github/copilot-instructions.md` ready to commit.

See [How It Works](docs/CONCEPTS.md) for detailed walkthrough.

---

## Example

Your auto-generated file looks like:

```markdown
# Copilot Instructions: Your Project

## PROJECT
Rails payment processing platform with real-time reporting.

**Tech**: Ruby on Rails, React, PostgreSQL, Sidekiq, Redis

## CODE CONVENTIONS
- Naming: Action+Noun (ProcessPayment, FetchReport)
- Files: app/models/[domain]/, app/services/[domain]/

## GOTCHAS
1. N+1 queries → always use .includes()
2. Race conditions in cache → use pessimistic locks
3. Webhook timeouts → implement exponential backoff

## INTEGRATIONS
- Stripe API (100 req/sec, sandbox vs prod keys differ)
- Datadog (logs + APM, lag of 60 sec)

## DEBUGGING
Sentry for production errors, Rails logs in dev, print statements for tracing.

## JARGON
- PCI = Payment Card Industry
- 3DS = 3D Secure (card verification)
```

---

## For Your Team

### Share with Coworkers

1. Commit `.github/` to your repo
2. Push to main
3. New engineers clone repo
4. Run `/setup-agent`
5. Done ✅ (5 min onboarding)

### Update When Things Change

Major tech shifts?
```
/setup-agent Update — we switched to TypeScript, added k8s
```

Only asks for changed answers. Keeps previous answers.

---

## Why This Works

✨ **Code scanning** — Auto-detects 80% of context  
✨ **Team-focused** — Solves onboarding, not just individual use  
✨ **Zero infrastructure** — Just markdown files, works today  
✨ **Shareable** — Commit to git, use everywhere  

**The insight**: Don't make engineers explain "how our codebase works" again for each AI tool. Learn once, use everywhere.

---

## License

MIT — Use freely, modify as needed, share with your team.

---

**Built for teams that code together.** 🚀
