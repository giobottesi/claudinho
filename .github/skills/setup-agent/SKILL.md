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

### Phase 2: Interactive Q&A (Light Touch + Iterative)

Instead of one heavy questionnaire, you answer questions **as they come up** in chat:

**Category A: Codebase realities** (What code can't see)
- What breaks regularly + why? (then: how do you prevent it?)
- What external services/integrations matter? (then: what constraints do they have?)
- How does your team actually debug? (tools, workflows, patterns)

**Category B: Agent customization** (How you want to be treated)
- Response style preference: polite vs direct, verbose vs concise, theoretical vs practical?
- Code patterns you emphasize or avoid?
- Communication norms: show working? ask clarifying questions? when to punt?

The skill gathers answers **incrementally**—start with 1-2, add more as issues come up naturally. No requirement to answer everything upfront.

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
