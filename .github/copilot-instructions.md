---
description: 'Smart Copilot agent setup framework. Scan codebases + answer 5 questions → auto-generate .github/copilot-instructions.md for any project. Includes 5 specialist skills (setup-agent, data-analysis, explain, capture-learning, brag).'
model: 'Claude 3.7 Sonnet'
---

# Copilot Instructions: claudinho (Dev-Agent Framework)

## PROJECT

**Name**: claudinho  
**Repository**: https://github.com/giovannabottesi/claudinho  
**Purpose**: Smart agent setup framework for GitHub Copilot. Teach Copilot about any project via code scanning + guided questionnaire.

**Type**: Template framework (docs + skills + agent configuration)

**Core Value Proposition**:
- Auto-detects tech stack, file organization, naming patterns, build commands
- Asks only 5 human questions (what code can't know)
- Auto-generates `.github/copilot-instructions.md` ready to commit
- Result: Copilot understands your project immediately

---

## CODE CONVENTIONS & STRUCTURE

### File Organization
```
.github/
├── agents/
│   └── copilot-instructions.agent.md          # Main agent definition (generic dev agent)
├── skills/
│   ├── setup-agent/SKILL.md                   # Code scanner + questionnaire → generate instructions
│   ├── data-analysis/SKILL.md                 # SQL queries, trends, anomalies
│   ├── explain/SKILL.md                       # Learn systems, deep dives
│   ├── capture-learning/SKILL.md              # Save patterns for reuse
│   └── brag/SKILL.md                          # Document work with evidence
└── COPILOT_INSTRUCTIONS_TEMPLATE.md           # Template that setup-agent fills

Root docs/
├── README.md                                   # Entry point (what is this?)
├── QUICK_START.md                              # < 5 min setup path
├── INSTALLATION.md                             # Detailed installation + Q&A guide
├── CONCEPTS.md                                 # How it works (file org & setup phases)
├── CURIOSITY.md                                # Research, design philosophy, comparisons
└── examples/                                   # Real output files from example projects
```

### Naming Conventions
- **Skills**: kebab-case, action-noun (setup-agent, data-analysis, capture-learning)
- **Files**: UPPERCASE.md for docs, PascalCase for agent/skill names in code
- **Domains**: Agent context (instructions), specialized behaviors (skills)

### Key Patterns
1. **Skills**: Modular, focused expertise. Each SKILL.md is independent and invoked via `/skill-name` or `@skill-name`
2. **Agent**: Generic dev agent that delegates to specialists based on request type
3. **Template**: `COPILOT_INSTRUCTIONS_TEMPLATE.md` is filled by setup-agent based on scanning + Q&A

---

## KNOWN GOTCHAS & INTEGRATIONS

### What Breaks Often
TBD—framework is new. As users encounter issues, document here:
- [ ] Skills not being discovered/invoked
- [ ] YAML frontmatter syntax errors
- [ ] VS Code Copilot Chat version conflicts
- [ ] File path resolution in agent configuration

### External Services/Dependencies
- **GitHub**: Copilot Chat API, repository hosting (required)
- **VS Code**: Copilot Chat extension (required for `/setup-agent` and skill delegation)

### Debugging Style
- **Output method**: Inline string outputs in Copilot Chat, console logs
- **Testing**: Manual Copilot Chat invocation (`/setup-agent`, skill calls, agent delegation)
- **Validation**: Generated files match expected structure + content

---

## AGENT CAPABILITIES & DELEGATION

### Main Agent (copilot-instructions.agent.md)
Generic development assistant for full feature lifecycle:
- Specification → Implementation → Testing → Deployment
- Architecture & design decisions
- Tech debt & refactoring
- Debugging & integration issues

**Auto-delegates to**:
| Request Type | Delegate To | Example |
|---|---|---|
| Code scanning + personalization | `/setup-agent` | "Setup my agent" |
| Data analysis, SQL, trends | `/data-analysis` | "Analyze error frequency" |
| Learning, deep explanations | `/explain` | "How does skill delegation work?" |
| Save learnings, patterns | `/capture-learning` | "Save this for reuse" |
| Document work, build brag | `/brag` | "Document this feature" |

### Skills (Modular Expertise)
Each skill is independent, invoked via `/skill-name`:
- **setup-agent**: Phase 1 (code scanning) → Phase 2 (5 questions) → Phase 3 (generate instructions)
- **data-analysis**: SQL, pandas, trends, cohort analysis, anomaly detection
- **explain**: Papers, systems, concepts, design decisions
- **capture-learning**: Personal knowledge management, insights, patterns
- **brag**: Work documentation, impact capture, portfolio building

---

## WEEK-1 KNOWLEDGE FOR NEW USERS

**See [QUICK_START.md](../QUICK_START.md)** for immediate onboarding:
- TL;DR: Copy `.github/` → Run `/setup-agent` → Answer 5 questions
- Takes < 5 minutes
- Outputs `.github/copilot-instructions.md` ready to commit

**Critical facts**:
1. This is a **template framework**, not a finished agent—users copy `.github/` into their own repos
2. Running `/setup-agent` **auto-detects** tech stack via code scanning
3. The **5 questions** capture knowledge that code cannot detect
4. **Output file** (`.github/copilot-instructions.md`) gets committed to the user's repo—it teaches *their* Copilot about *their* project
5. **Skills** are optional but powerful—delegate to `/data-analysis` for metrics, `/explain` for learning, etc.
6. **Update** when your project changes significantly (new framework, renamed conventions, new domains)

---

## HELPFUL REFERENCES

- **Quick Start**: [QUICK_START.md](../docs/QUICK_START.md) — < 5 min setup
- **Installation**: [INSTALLATION.md](../docs/INSTALLATION.md) — Detailed guide + examples
- **How It Works**: [CONCEPTS.md](../docs/CONCEPTS.md) — File org + setup phases
- **Research**: [CURIOSITY.md](../docs/CURIOSITY.md) — Design philosophy, comparisons, FAQ
- **Examples**: [examples/](../examples/) — Real output files
