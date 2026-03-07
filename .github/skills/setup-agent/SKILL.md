---
name: setup-agent
description: "Scan code + ask 5 questions → Auto-generate your project's copilot context file. Use when: setting up a new repo or updating an existing agent."
argument-hint: "Just type: /setup-agent"
user-invocable: true
---

# Setup Agent (Smart Code Scanning + Guided Questionnaire)

Scan your codebase + answer 5 personal questions → Get a ready-to-use `.github/copilot-instructions.md` file that teaches your team's AI assistant how your project works.

---

## Why This Exists

Without context, Copilot asks stupid questions. With context, it understands your codebase immediately.

This skill saves time by:
- ✅ **Auto-detecting** tech stack, file org, naming patterns, commands (just scans existing code)
- ✅ **Asking only humans** what code can't detect: failure modes, external service constraints, debugging workflows, team terminology (5 targeted questions)
- ✅ **Generating immediately** a ready-to-use `.github/copilot-instructions.md` your team commits to git

---

## How to Use

Just start:
> `/setup-agent`

Or if updating:
> `/setup-agent Update — we just switched to TypeScript`

---

## What Happens

### Phase 1: Code Scanning (Automatic)

The skill scans your repo and detects:
- **Tech stack**: Languages, frameworks, libraries (from imports, package.json, Gemfile, etc.)
- **File organization**: Where models, services, tests, config live
- **Naming patterns**: How classes, functions, modules are named
- **Build commands**: How to test, start server, migrate DB (from package.json, Rakefile, bin/)
- **Main domains**: What systems/concepts exist (from directory structure)

No questions asked—this all happens automatically.

### Phase 2: Interactive Q&A (Protocol + Technical Knowledge)

**Question 1: Response Style Protocol**
> "How should Copilot communicate with you?"
> - **Zero Polite**: Terse, direct answers (no fluff, assume context)
> - **Detailed Walkthroughs**: Step-by-step, explain reasoning, slower-paced

This sets the communication norm for ALL future interactions.

**Question 2: Ask-Before-Infer Mandate**
> "When facing architectural ambiguity, should Copilot ask clarifying questions or try to infer from context?"
> - **Always ask**: Safer, you control decisions
> - **Infer when safe**: Faster iteration, ask only on risky decisions and flags assumptions in suggestions.

**Questions 3-5: Technical Deep Dives** (What code can't see)
- What breaks regularly + why? (Prevention patterns)
- What external services/integrations matter? (Constraints, SLAs, rate limits)
- How does your team actually debug? (Tools, workflows, patterns)
- How your team talks about the system. What are keywords, business terms, abbreviations, acronyms? - it will add to context while you code but initial understanding of those helps with better suggestions and less "stupid questions" from the agent.

---

## Output

The skill generates `.github/copilot-instructions.md` formatted like this:

```markdown
# Copilot Instructions: User Analytics Platform

## PROJECT

**Name**: User Analytics Platform  
**Description**: Tracks user events, aggregates metrics, powers dashboards

**Tech Stack**: Python, Django, React, PostgreSQL, Redis, Docker, AWS

**Main Domains**:
- Event tracking (ingest, normalize, deduplicate user events)
- Metrics aggregation (real-time + historical reporting)
- Dashboard API (query metrics by segment, time range, filters)

## CODE CONVENTIONS

### Naming
- **Action+Noun**: `EventProcessor`, `MetricsAggregator`, not `EventHandler` or `Manager`
- **Where files live**: Models in `app/models/`, services in `app/services/events/`, tests in `tests/unit/[path]/`

## KNOWN GOTCHAS & INTEGRATIONS

**What breaks often**:
- Out-of-order events cause metric double-counts—always deduplicate by event ID + timestamp pair
- External event sources timeout after 30s—implement queue + retry for reliability
- Dashboard queries on unfiltered large date ranges timeout—educate users on time-bound queries

**External services**:
- Segment.com: Ingests raw events, rate-limited 1k events/sec. Late arrivals (>24h) dropped silently.
- Mixpanel: Exports validated metrics hourly. Check dashboard before investigating discrepancies.

**Debugging style**:
- DataDog for infrastructure. Application logs (structured JSON) in CloudWatch.
- Event replay: Query raw events table + trace through processor pipeline.

**Domain jargon**:
- Dead lettering: Events that fail validation go to DLQ (dead-letter queue) for manual review.
- Unique count (HyperLogLog): Probabilistic, fast. Cardinality ±2%. Use only for "users" metrics.
```

Ready to copy into your repo immediately.

---

## Upgrade Cycle: When to Re-run

**First run** (one-time setup):
- Right after copying `.github/` into your repo (~5 minutes)
- Answer 1-2 initial questions, add more as you work

**Periodic updates** (every month or after major changes):
- **Monthly cycle**: Run `/setup-agent` → answers refresh auto-detected patterns + any new gotchas you discovered
- **After framework upgrade**: New tech stack needs scanning (Rails → Next.js, Python 3.10 → 3.12)
- **After architectural shift**: New domains, new integrations, renamed conventions
- **When hiring**: New engineer runs it + adds their learnings (response style, code pattern preferences)

**How to upgrade**:
```
/setup-agent Update: [what changed]
```
Examples:
- `/setup-agent Update: switched to TypeScript`
- `/setup-agent Update: added OAuth service`
- `/setup-agent Update: new debugging discovery`

**Result**: Updated `.github/copilot-instructions.md` → Commit → Every team member's Copilot reads the latest context

---

## Tips for Answering Questions

**Codebase: What breaks often**:  
✅ "Out-of-order events corrupt metrics—deduplicate by event ID + timestamp. External timeouts at 30s—queue + retry prevents cascades."  
❌ "Lots of things" | "Performance issues"

**Codebase: External services**:  
✅ "Segment ingests events (1k/sec limit), drops >24h late arrivals silently. Mixpanel exports hourly—check before investigating discrepancies."  
❌ "We use some APIs" | "Mixpanel"

**Codebase: Debugging workflow**:  
✅ "DataDog for infrastructure. JSON logs in CloudWatch. For event issues: query raw table + trace through EventProcessor → AggregationService. Check METRIC_PIPELINE.md before changing logic."  
❌ "Console logs" | "DataDog"

**Customization: Response style**:  
✅ "Direct + technical. Skip warmth. Show complete code. Assume I know jargon. Ask only if ambiguous."  
❌ "Be helpful"

**Customization: Code patterns**:  
✅ "Prefer Action+Noun naming. Keep coupled logic tight (error classification with decision flow). Soft-delete everything with timestamps for audit trails."  
❌ "Standard patterns"

---

## Real Example: Infrastructure Setup

Here's how it actually looks in chat:

```
Analyzing your answers...

How should Copilot communicate with you?
→ Zero Polite
  (Terse, direct answers. Assume full context. No fluff.)

When facing architectural ambiguity, should Copilot ask clarifying questions or infer from context?
→ Always Ask
  (Safer, you control decisions)

What breaks often in your infrastructure?
→ "i dont have enough context"
  (Honest answer! Agent notes: New to project, skip assumptions. Ask before suggesting fixes.)

What external services/integrations does your infrastructure depend on?
→ "i dont know what is relevant for now"
  (Also ok! Agent will ask specific questions as work surfaces.)

How does your team debug infrastructure issues?
→ "im learning to navigate this project, in others i like old school logs debug"
  (Key insight: Prefers log-based debugging, still learning codebase. Agent will reference diagnostics + explain, not assume.)
```

**Result**: Agent learns:
- You want direct, no-nonsense communication
- You prefer to control decisions (always ask before inferring)
- You're new here—explain context, don't assume deep domain knowledge
- You like log-based debugging—surface relevant log locations first

**Next**: As you discover patterns, run `/setup-agent Update: found X` to refresh the agent's memory.

---

## Output: What You Get

Copy-paste ready file: `.github/copilot-instructions.md`

Once saved, your agent (any engineer, any coworker) will:
- Know your tech stack instantly
- Follow your naming conventions automatically
- Understand your domains without explanation
- Suggest code that matches your patterns

**Result**: Copilot gives answers tailored to YOUR project, not generic answers.

---

## What Your Agent Now Knows

After running setup-agent:
- ✅ Your tech stack and how to run it
- ✅ How you name things and where files live
- ✅ What external services you depend on
- ✅ What breaks often and how to prevent it
- ✅ Your debugging style + team jargon
- ✅ Week-1 knowledge for new engineers

**Result**: Copilot gives answers tailored to YOUR project, not generic answers. New engineers are productive in their first week.
