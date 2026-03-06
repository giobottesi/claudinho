---
name: explain
description: "Educational explainer. Deep dives into systems, papers, concepts. Use when: you need to understand something (not build it) — explain codebases, papers, patterns, design decisions."
argument-hint: "What do you need to understand? (e.g., 'How does the circuit breaker work?')"
user-invocable: true
---

# Explain (Study Helper)

Specialized workflow for learning and understanding—deep dives into systems, papers, concepts, codebases, design decisions.

## When to Use

- **Understanding a system**: How does X work?
- **Learning a concept**: What is a Circuit Breaker? State machine? Event sourcing?
- **Reading a paper**: Explain research, prove assumptions
- **Tracing a flow**: How does data move from A to Z?
- **Design patterns**: Why is this built this way?

---

## Learning Approach

**SCAFFOLDED**: High-level concept → Decompose → Examples → Connections → Offer depth

**CONCRETE**: Every abstraction gets real code examples from the codebase

**NAMED**: Name patterns early, use precise terminology

**CONNECTIVE**: Link to what you already know

**LAYERED**: Start at your level, offer deeper layers ("Want to go deeper?")

---

## Understanding a System

1. **Entry point**: Where does data flow in?
2. **Happy path**: Trace one successful request
3. **Layers**: Separate concerns (domain, I/O, state, errors)
4. **Patterns**: What design patterns are used?
5. **Constraints**: Why is it built this way?
6. **Trade-offs**: What's been sacrificed for what?

---

## Understanding a Concept

1. **Name it**: What's it called? What's the origin?
2. **Problem**: What problem does it solve?
3. **Structure**: How's it organized?
4. **Example**: Show real code
5. **Variants**: When use each variant?
6. **Trade-offs**: What's the cost?

---

## Learning Levels

- **Level 1**: Concept — What is this?
- **Level 2**: Structure — How's it organized?
- **Level 3**: Flow — How does data move?
- **Level 4**: Trade-offs — Why this design?
- **Level 5**: Variants — When use each?

Offer explicitly: "Want to go deeper?"

---

## Search Strategy

1. **Semantic**: "How does [system] handle [thing]?" (broad)
2. **Grep**: "Find all uses of [pattern]" (usage)
3. **File**: "Find files with [pattern]" (geography)
4. **Read**: Start broad, narrow based on understanding

---

## Output

- Pull code from actual codebase (not made-up examples)
- Show context, not isolated snippets
- Annotate critical decision points
- Offer Mermaid diagrams for flows/state machines

---

## Start Here

Ask what you want to understand:
- "Explain how the circuit breaker pattern prevents cascading failures"
- "Walk me through the OAuth refresh flow in our API client"
- "What's the strategy pattern and when do we use it?"
- "Explain the soft-delete pattern in our codebase"

The skill will scaffold your understanding from basics to depth.
