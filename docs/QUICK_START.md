# Quick Start (< 5 min)

> Setup: Copy `.github/` to your repo. Run `/setup-agent` in VS Code Copilot Chat. Done.

## The Flow

```bash
# 1. Copy framework into your repo
cp -r .github/ your-repo/

# 2. Open VS Code, open Copilot Chat
cd your-repo

# 3. Trigger setup-agent
/setup-agent

# 4. Answer 1-2 questions now, add more as you work
# (Q1 is usually "what breaks in your codebase?")

# Done ✓
```

---

## What Happens

### Automatic (No Questions)
- **Tech stack detection**: Languages, frameworks, libraries from code
- **File organization**: Where models, services, tests live
- **Naming patterns**: How classes, functions are named
- **Build commands**: Test, dev server, deploy steps

### Interactive (You Answer)
Start simple:
1. **What breaks often + why?** (gotchas, prevention)
2. **External services + constraints?** (APIs, rate limits, auth)

Add more as you discover:
- **Debugging workflow?** (tools, logs, where to look)
- **Domain jargon?** (team terminology, patterns)
- **Agent customization?** (response style, code patterns you prefer)

---

## Output

Generates `.github/copilot-instructions.md`  
→ Commit to git  
→ Every engineer's Copilot reads it automatically

---

## Maintenance: Monthly Updates

After a month (or major change), re-scan:
```
/setup-agent Update: [what changed]
```

Examples:
- `/setup-agent Update: switched to TypeScript`
- `/setup-agent Update: discovered race condition pattern`
- `/setup-agent Update: added Stripe integration`

Result: Updated instructions → commit → team pulls → Copilot refreshes

---

## For Your Team

1. Copy `.github/` → your repo
2. First person runs `/setup-agent` (5 min)
3. Commit `.github/copilot-instructions.md`
4. Team members pull
5. Their Copilot now understands your project

**Monthly**: Run `/setup-agent Update: [...]` to keep context fresh.

---

## Learn More

- [Installation Guide](INSTALLATION.md) — Detailed walkthrough
- [How It Works](CONCEPTS.md) — Architecture + design
- [Design Philosophy](CURIOSITY.md) — Why this approach
