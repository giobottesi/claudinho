# Installation Guide

> ⚠️ **Early Stage**: claudinho is in active development. It only creates `.github/` files (doesn't modify your actual code), so you can safely commit it for team use or keep it local for testing.

## Prerequisites

- VS Code with GitHub Copilot Chat extension
- Your project repository (any language)

## Step-by-Step

### 1. Get the Files

**Option A: Clone**
```bash
git clone https://github.com/giovannabottesi/claudinho.git
cd claudinho
```

**Option B: Download ZIP**
- Visit the GitHub repo
- Click **Code** → **Download ZIP**
- Unzip locally

### 2. Copy `.github/` Folder

**Recommended:**
```bash
cp -r .github/ /path/to/your-project/
```

**What gets copied:**
```
.github/
├── agents/
│   ├── copilot-instructions.agent.md          # Main dev agent
│   └── references/
│       ├── dev-profile-TEMPLATE.md            # Personal profile template
│       ├── dev-profile-patterns.md            # Generic patterns reference
│       └── README.md                          # Guide to profiles
├── skills/
│   ├── setup-agent/SKILL.md                   # Code scanner + questionnaire
│   ├── data-analysis/SKILL.md                 # Data analysis specialist
│   ├── explain/SKILL.md                       # Learning & explanations
│   ├── capture-learning/SKILL.md              # Personal knowledge management
│   └── brag/SKILL.md                          # Work documentation
├── COPILOT_INSTRUCTIONS_TEMPLATE.md           # Template for setup-agent to fill
└── copilot-instructions.md                    # Auto-generated after /setup-agent runs
```

**If copying manually**: Don't skip `agents/references/` or `COPILOT_INSTRUCTIONS_TEMPLATE.md`—setup-agent needs both.

### 3. Open Your Project in VS Code

```bash
cd /path/to/your-project
code .
```

### 4. Run Setup

In **Copilot Chat** (Cmd+Shift+K on Mac, Ctrl+Shift+K on Windows/Linux):

```
/setup-agent
```

**What happens:**
1. Setup-agent scans your codebase (30 seconds)
2. Asks 5 questions about your project
3. Generates `.github/copilot-instructions.md`

### 5. Review & Commit

```bash
# Check the generated file
cat .github/copilot-instructions.md

# Commit to git
git add .github/
git commit -m "feat: add Copilot agent context"
git push
```

---

## The 5 Questions

When you run `/setup-agent`, you'll answer 5 questions. See [QUICK_START](QUICK_START.md) for examples and what to write.

---

## After Setup

Your agent is ready to:
- ✅ Suggest code matching your patterns
- ✅ Catch common mistakes
- ✅ Explain your conventions
- ✅ Delegate specialists for complex work

**No further setup needed.** Copilot learns automatically.

---

## For Your Team

### Share with Coworkers

1. Commit the full `.github/` folder:
   ```bash
   git add .github/
   git commit -m "feat: add Copilot agent context"
   git push
   ```
2. Coworkers clone your repo
3. They run `/setup-agent` in Copilot Chat
4. They answer 5 questions (5 min) or confirm existing ones (2 min)
5. Done

### New Members

New engineers onboarding:
```bash
# Clone repo
git clone [your-repo]
cd [your-repo]

# VS Code
code .

# Copilot Chat
/setup-agent

# Answer 5 questions (or confirm existing answers)
```

That's it. They're productive by day 2.

---

## Troubleshooting

### "I don't see /setup-agent in Copilot Chat"

1. Verify `.github/skills/setup-agent/SKILL.md` exists in your repo
2. Reload VS Code (Cmd+R / Ctrl+R)
3. Check that you're using latest Copilot Chat extension

### "Setup-agent is asking me 11 questions, not 5"

You have an old `COPILOT_INSTRUCTIONS_TEMPLATE.md`. Update it:

```bash
# Copy the new one from this repo
cp COPILOT_INSTRUCTIONS_TEMPLATE.md /path/to/your-project/.github/
```

### "My .github/copilot-instructions.md is missing tech stack"

The code scanning didn't work. Manually fill it:

```bash
# Open the template
open .github/COPILOT_INSTRUCTIONS_TEMPLATE.md

# Under "Automatic Detection" section, add your tech stack
```

### "Can I update the agent later?"

Yes. Run:
```
/setup-agent Update — we added Kubernetes, switched to TypeScript
```

It will only ask for changed answers.

---

## Next Steps

- Read [QUICK_START.md](QUICK_START.md) for fastest path
- Check [../examples/](../examples/) for real output
- See [CONCEPTS.md](CONCEPTS.md) for how everything works
