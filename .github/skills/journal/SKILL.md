---
name: journal
description: "Unified journal for capturing work and learnings. Records what you did, the impact, and insights learned. Use when: you've completed work or learned something worth remembering."
argument-hint: "What did you do or learn? (e.g., 'Debugged circuit breaker race condition' or 'Built auth system')"
user-invocable: true
---

# Journal: Unified Work & Learning Capture

Single skill for recording **work completed** and **insights learned**. Combines brag documentation + personal knowledge management into one workflow.

Creates **JOURNAL.csv** (queryable) + **JOURNAL.md** (index + analysis).

---

## When to Use

- **After completing a feature**: "Built and shipped feature X"
- **After solving a bug**: "Debugged and fixed the N+1 query issue"
- **After learning a pattern**: "Discovered this approach works better for circuit breaker"
- **Weekly reflection**: "Captured this week's learnings"
- **After architecture work**: "Reorganized the event system"

---

## Smart Questions: Only What Matters

The skill **infers from context** (date, project, what you mention in chat) and asks only essential questions:

### Auto-Detected (You Don't Answer):
- **Date**: Today or extracted from your message
- **Project**: Inferred from current workspace/context
- **What**: Extracted from your initial description
- **Skills**: Parsed from your technical language

### You Answer (3 Core Questions):
1. **Scope**: How far does this reach? (Local change | System-wide | Cross-service)
2. **Evidence**: What's the proof? (PR link, docs, issue #, or "none")
3. **Learning**: What's the reusable pattern? (1-2 sentences, or "n/a")

**Why only 3?** Reduces cognitive load. Lazy engineers still capture data. No "performance review" vibe.

---

## Example: Minimal Capture

**You say**: "Just fixed the circuit breaker race condition in payment service. PR is here: link"

**Skill infers**:
- Title: "Fixed circuit breaker race condition"
- Date: Today (Mar 7, 2026)
- Project: Payment service
- What: Extracted from your message
- Skills: Payment, circuit breaker, concurrency (from tech language)

**Skill asks you**:
1. Scope: System-wide (affects all payment requests) or Local (just this module)?
2. Evidence: [Already have the PR link]
3. Learning: Pattern discovered? (or "n/a" to skip)

**Output**: 1 row in JOURNAL.csv + linked entry in JOURNAL.md

---

## Flow: Minimal, Smart, Fast

When you invoke `/journal [what you did]`:

1. **Skill infers from context**: Date, project, what, skills (parsed from your tech language)
2. **Skill asks only 3 questions**:
   - Scope: (Local | System-wide | Cross-service)—objective engineering fact, not subjective "impact"
   - Evidence: PR link, docs, issue #, or "none"
   - Learning: Reusable pattern, or "n/a" to skip
3. **Done**: CSV row added, JOURNAL.md auto-updated

**Why this works**: Lazy engineers still answer 3 questions. No performance review vibe. Inference handles 80%.

---

## Output Format

Generates a single queryable entry:

### JOURNAL.csv (Data Row Added)
```csv
date,title,type,scope,skills,evidence,learning_pattern
2026-03-07,Fixed circuit breaker race condition,Bugfix,System-wide,"Concurrency, Payment, Circuit breaker",PR#1234,"Race conditions in async state machines need atomic transitions"
2026-03-05,Built error classification system,Feature,Cross-service,"Error handling, Backend, API",PR#1233; Docs link,"Explicit classification > generic exception handlers"
2026-02-28,Added caching layer,Feature,Local,"Performance, Redis, Backend",PR#1225,"Measure cache hit rate before optimizing further"
```

### JOURNAL.md (Auto-Updated Index)
Navigator + self-analysis:

```markdown
# Journal: Work & Learning

**Last updated**: Mar 7, 2026

## Recent Work (Last 7 Days)
- 2026-03-07: [Fixed circuit breaker race condition] — System-wide
- 2026-03-05: [Built error classification system] — Cross-service
- 2026-02-28: [Added caching layer] — Local

## Work by Scope
- **System-wide** (6): Circuit breaker, API redesign, database migration, ...
- **Cross-service** (4): Error classification, authentication, ...
- **Local** (8): Bug fixes, optimization, ...

## Skills Frequency (Last 30 Days)
- Backend: 12 entries
- Error handling: 8 entries
- Performance: 6 entries
- ...

## Learning Patterns (Top 3)
1. Explicit > implicit (classification, state, config)
2. Measure before optimize (caching, query perf)
3. Atomic operations beat partial state (race conditions)
```

All searchable/queryable data lives in JOURNAL.csv. Markdown provides navigation + trends.

---

## Tips

**Scope is objective**: "System-wide" beats "high impact"—it's a measurable fact, not marketing

**Inference breaks cognitive load**: The skill knows it's today, it's this project. You only answer the 3 hard questions

**Evidence links = searchability**: PRs, docs, issues. You'll find these entries later.

**Learning is optional**: Pure brag? Skip question 3. The skill captures it anyway.

**Patterns auto-surface**: After 3+ entries in same skill area, JOURNAL.md highlights trends

**Capture immediately**: While the code is fresh in your head (not 3 days later)

---

## Start Here

Just tell the skill what you did:

- `/journal Fixed circuit breaker race condition in payment service`
- `/journal Built authentication system`
- `/journal Discovered that pagination breaks with cursor-based sorting`

The skill infers context + asks 3 questions. Done. JOURNAL.csv + JOURNAL.md updated.
