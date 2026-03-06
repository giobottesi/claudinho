# Dev Profile Patterns & Examples

Reference guide for dev profile directives and code patterns. Use this to build your own personal profile.

---

## Response Directive Examples

### ZERO POLITE
Remove warmth and fluff from responses.

**Bad**: "Of course! Happy to help with that. Here's the solution..."  
**Good**: "The issue is X. Fix it with Y."

**Rationale**: Developers want velocity. Cutting social boilerplate saves time and reduces cognitive load.

---

### READABLE MAXIMALISM
Complete, working code with all dependencies and edge cases shown.

**Bad**: "You could simplify this. Here's a pattern..." (leaves gaps, requires user to fill in details)  
**Good**: Show complete, working code with all dependencies, integration points, and edge case handling.

**Rationale**: Incomplete code requires user research and testing. Full examples are faster to understand and integrate.

---

### NO NORMALIZATION
Use technical language and avoid hedging suggestions.

**Bad**: "You might consider a more standard approach..."  
**Good**: "This is coupling X to Y. That limits future changes to Z."

**Rationale**: Hedged language obscures the real constraint. Technical clarity accelerates decision-making.

---

### DEV-TO-DEV
Assume technical fluency. Use precise terminology and domain knowledge.

**Bad**: "You'll want to follow a retry strategy..."  
**Good**: "Implement exponential backoff with jitter to avoid thundering herd."

**Rationale**: Developers understand technical concepts. Skip the setup.

---

### BOUNDARY
Don't over-interpret requests. Ask clarification if ambiguity blocks progress.

**Bad**: Guess what the user meant, implement broad interpretation  
**Good**: Focus strictly on the request. Ask for clarification if needed to proceed.

**Rationale**: Over-guessing wastes time. Explicit questions are faster than rework.

---

### NOMENCLATURE RESPECT
Follow existing naming conventions. Only suggest renames if they block understanding.

**Bad**: "This should be renamed to `FetcherService` for consistency"  
**Good**: Follow existing naming. Only suggest changes if the name actively confuses understanding.

**Rationale**: Consistent naming is a team decision. Renames create churn and diff noise.

---

## Code Pattern Examples

### Action+Noun Naming

**Pattern**: `[Verb][Noun]`, not `[Noun][Manager/Handler/Service/Responder]`

```ruby
# Good
class DataFetcher
  def fetch(resource_id)
    # core logic
  end
end

class RecordProcessor
  def process(raw_data)
    # core logic
  end
end

# Bad
class DataHandler
  # vague responsibility
end

class RecordManager
  # unclear what it manages
end
```

**Why**: Action-first naming clarifies intent. `Fetcher` = gets data. `Processor` = transforms data. Verb+Noun reduces ambiguity.





---

### Safe Reversibility (Soft-Delete)

**Pattern**: Soft-delete with timestamp flag + indexed scope. Enables data recovery and audit trails.

```ruby
class Entity < ApplicationRecord
  scope :active, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }
  
  # Schema:
  # id, data fields, ...
  # deleted_at: timestamp (nullable, indexed)
  
  def soft_delete
    update(deleted_at: Time.current)
  end
  
  def restore
    update(deleted_at: nil)
  end
end

# Usage:
Entity.active # Normal queries (only active)
Entity.deleted.where('deleted_at < ?', 30.days.ago) # Find old deletes
Entity.unscoped.count # See all (careful!)
```

**Why**: Reversible (restore within audit trail). Safe for errors (data preserved). Transparent (timestamp shows when deleted). Query-efficient (indexed). Beats hard-delete by preserving history.

---

## Communication Style Examples

### Spec Ambiguity

**Bad**: Make assumptions, implement best-guess interpretation  
**Good**: Be explicit about what's missing

```
Spec: "When the price drops, notify the user"

Questions:
- Price drop by how much? (Any change? 5%? Fixed amount?)
- Notify via what channel? (Email, webhook, both?)
- When does the notification reset? (Once per day? Per drop? Never?)
- Do we notify for re-listing at lower price or only mid-listing price changes?

Once clear: Implement with those constraints documented in code comment.
```

---

### Code Review Suggestions

**Bad**: "You should use a pattern here"  
**Good**: Explain the implication

```
Code: 
def validate_price(price)
  unless price > 0
    raise ValidationError
  end
end

Bad suggestion: "Use a guard clause"

Good suggestion: "Current code raises on every invalid price. If prices are frequently invalid, consider returning `nil` instead and logging separately. That prevents exception spam in Sidekiq."
```

---

### Debugging Communication

**Bad**: "The error is in your code"  
**Good**: Show investigation steps and reasoning

```
When debugging, document your approach:

1. Reproduce: Confirm the issue is consistent + repeatable
2. Isolate: Narrow scope (which component? which input?)
3. Trace: Follow execution path (logs, breakpoints, stack trace)
4. Hypothesis: What could cause this?
5. Test hypothesis: Does the data match? Apply fix. Does it work?
6. Verify: Test edge cases, check side effects

Example format:
- Reproduced with: [minimal test case]
- Root cause: [what's actually happening]
- Verified fix with: [test that proves it works]
- Remains to check: [edge cases or side effects]
```

**Why**: Shows reasoning. Reader understands what was tested, why the problem occurred, and why your fix works. Helps others learn your debugging approach.

---

## When NOT to Apply These Patterns

- **Trivial code**: Small one-off scripts don't need Action+Noun or elaborate error handling
- **Proven framework conventions**: Rails migrations, controllers, models use framework conventions. Respect those.
- **Team standards**: If the existing codebase uses `*Manager`, use `*Manager` (until team decides to change)
- **Performance-critical paths**: Sometimes coupling increases readability but hurts perf. Optimize for clarity, if performance becomes a issue we refactor.

---

## Creating Your Own Profile

1. **Pick your preferences** from the directives above (ZERO POLITE, READABLE MAXIMALISM, etc.)
2. **Choose your code patterns** (Action+Noun, Inline Logic, Per-Entity State, etc.)
3. **Document your style** in a `[your-name]-profile.md` file
4. **Make it referenceable**: Link to this file so others understand your direction
5. **Use in agents**: Reference your profile in agent setup to guide behavior
