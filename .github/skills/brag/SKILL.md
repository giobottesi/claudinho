---
name: brag
description: "Build brag documentation. Capture work, impact, and date. Formats into clean brag entries. Use when: you've completed work and want to document it for portfolios, reviews, or retrospectives."
argument-hint: "What work did you complete? (e.g., 'Built React dashboard for user analytics')"
user-invocable: true
---

# Brag Documentation

Quick capture and formatting for work you've completed—impact, scope, skills used.

## When to Use

- **After completing a feature**: "Finished the circuit breaker implementation"
- **After solving a bug**: "Fixed prompt injection vulnerability"
- **After architecture work**: "Reorganized agent system"
- **Periodic capture**: Weekly/monthly captures of work for reviews

---

## Input Format (What to Provide)

Tell me:
1. **What you built/fixed** (1-2 sentences)
2. **Type** (tag: Learning, Collaboration, Mentorship, Product, Documentation)
3. **Impact** (business, technical, user-facing)
4. **Date** (or "today")
5. **Key details** (bullet points of what you did)
6. **Evidence links** (PR, docs, Slack thread, etc. — optional but recommended)
7. **Skills used** (comma-separated)

**Example input**:
> Built error classification system for external API failures.
> Type: Product
> Impact: Tracks 25+ error patterns systematically, enables incident escalation.
> Date: Jan 29, 2026.
> Details:
> - Architected error classification system
> - Discovered silent failures in integration layer
> - Designed alerting system integration
> - Mapped error patterns across 5+ providers
> Evidence: Pull request link, error patterns documentation
> Skills: Error classification, backend development, API integration patterns

---

## Output Format

Generates clean brag entries ready for BRAG_DOC.md:

```markdown
#### [Title]
**Type**: [Learning | Collaboration | Mentorship | Product | Documentation]  
**Date**: [Date]  
**Impact**: [One-liner business/user/technical impact]

- [What you accomplished point 1]
- [What you accomplished point 2]
- [What you accomplished point 3]

**Evidence**: [Link to PR], [Link to docs], [Discussion thread]  
**Skills**: [Skill 1], [Skill 2], [Skill 3]
```

---

## Examples from Your Doc

### Example: Security Fix

```
#### Fixed Critical Security Vulnerability
**Type**: Product  
**Date**: Jan 29, 2026  
**Impact**: Prevented injection attacks—protected user data integrity

- Identified injection vulnerability in user input layer
- Restructured architecture to separate system from user data
- Implemented proper encoding across all input surfaces
- Validated fix against known attack vectors

**Evidence**: Pull request, security audit documentation  
**Skills**: Security analysis, vulnerability mitigation, architecture
```

### Example: Architecture Work

```
#### Agent System Architecture & Documentation
**Type**: Learning  
**Date**: Jan 29, 2026  
**Impact**: Created reusable AI agent architecture for team reuse + clear .github/ structure

- Architected modular agent + skill delegation pattern
- Designed specialized skills for different problem domains
- Documented workflows + usage patterns
- Organized configuration files for team shareability

**Evidence**: Architecture documentation, skill examples  
**Skills**: System architecture, documentation, agent design
```

---

## Process

1. **Capture immediately after work** (while fresh)
2. **Provide: title, impact, date, 3-5 bullets, skills**
3. **Skill formats it** into brag entry
4. **Copy/paste into BRAG_DOC.md** under appropriate month/year

---

## Tips

**Type tags**: Use consistently (Learning, Collaboration, Mentorship, Product, Documentation) for fast searching in BRAG_DOC.md.  
**Evidence links**: Include PRs, docs, Slack threads—makes work searchable and verifiable later.  
**Keep bullets tight**: 1 concrete fact per bullet. Not narrative.  
**Impact first**: Lead with business/user outcome, not implementation detail.  
**Skills are searchable**: Use consistent skill names so you can find patterns later.  
**Date matters**: Use for tracking trajectory (career growth, project history).  
**Group by month**: The skill won't organize—you'll do that in BRAG_DOC.md.

---

## Start Here

Just tell me what you completed:
- "Built authentication circuit breaker system for external APIs"
- "Fixed web scraper selectors after third-party site redesign"
- "Reorganized agent system to auto-delegate tasks"

The skill formats it into a brag entry ready to paste.
