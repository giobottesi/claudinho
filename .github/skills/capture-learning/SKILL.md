---
name: capture-learning
description: "Personal knowledge management. Captures learnings, patterns, decisions, insights across all projects. Use when: you've learned something worth remembering — insights, patterns, decisions, reusable approaches."
argument-hint: "What insight or pattern do you want to capture?"
user-invocable: true
---

# Capture Learning

Specialized workflow for recording knowledge—insights, patterns, decisions, learnings—across your projects.

## When to Use

**After learning something**: "I understand this now. Capture the distillation."

**After debugging a recurring issue**: "I've fixed this before. Log the pattern."

**After making a design decision**: "We chose this. Why? Capture the reasoning."

**After finding a useful pattern**: "I've used this approach multiple times. Log it."

---

## Capture Formats

### Minimum: Insight + Context

```
## [Topic/Pattern Name]

**What**: [1-2 sentence distillation]
**Context**: [Where did you learn this? What project?]
**When to use**: [Situation where this applies]
**Key detail**: [The thing that took time to figure out]
```

### Extended: Pattern + Variants + Trade-offs

For deeper learning:

```
## [Pattern Name]

**What**: [Distillation]
**Why it matters**: [Problem it solves]
**Variants**: [A / B / C]
**Trade-off**: Prioritizes X over Y because Z
**Example**: [Code or usage]
**Connected patterns**: [Related / Conflicts / Complements]
**Next learning**: [What would deepen understanding?]
```

---

## Knowledge Organization

### By Type

- Design patterns
- Code patterns
- Domain patterns
- Process patterns
- Trade-off patterns

### By Project

Section per project (Backend Services, Personal, Academic, etc.)

### By Connection

Link related patterns:
```
Circuit Breaker
├── Related: Bulkhead Isolation
├── Conflicts: Optimistic retry
└── Complements: Graceful degradation
```

---

## Reflection Templates

### Weekly Reflection

Track:
- What I learned
- Where it applies
- What to explore next
- Connections to existing knowledge

### Project Retrospective

Track:
- Biggest learning
- Pattern I'll reuse
- Anti-pattern I found
- Questions for next time

---

## Cross-Project Pattern Finding

After capturing 3+ similar insights across projects, consolidate into a reusable pattern.

Example:
```
Insight #1 (Project A): Error handling requires explicit incident logging
Insight #2 (Project B): Silent failures are costly, always log
Insight #3 (Project C): Graceful degradation beats exceptions

→ Pattern: "Explicit Error Tracking with Graceful Degradation"
```

---

## Start Here

Tell me:
1. What did you learn?
2. Where did you learn it (which project)?
3. When would you use it again?

The skill will help you distill it into a reusable format.

Example: "I just debugged a weird Rails N+1 query bug. It took me 2 hours to find because the query was inside a non-obvious loop. I want to remember this pattern."

Or: "We chose soft-delete over hard-delete for removed listings because we need audit trails and recovery capability. Capture this decision."

The skill will structure it and help you connect it to related patterns.
