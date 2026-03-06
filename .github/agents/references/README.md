# Agent References — Dev Profiles & Patterns

This folder contains reusable reference materials for agent customization and developer preferences.

---

## Files



### `dev-profile-patterns.md`
Comprehensive reference guide showing:
- 6 response directives with bad/good examples
- 2 code patterns with rationale (Action+Noun Naming, Safe Reversibility)
- 3 communication style examples
- When NOT to apply patterns

Use this to understand each directive and pick which apply to your style.

---

### `dev-profile-TEMPLATE.md`
Blank template for creating your own personal profile.

**To create your profile**:
1. Copy this file: `cp dev-profile-TEMPLATE.md .github/agents/references/[your-name]-profile.md`
2. Fill it out, checking boxes and adding notes
3. Reference it in agent configurations

---

## Pattern Organization (What Goes Where)

### Universal Patterns → `dev-profile-patterns.md`
Patterns that apply to any codebase, project, or domain:
- ✅ Response directives (ZERO POLITE, READABLE MAXIMALISM, etc.)
- ✅ **Action+Noun Naming**: Applies everywhere
- ✅ **Safe Reversibility**: Soft-delete pattern (generic example)
- ✅ **Debugging Communication**: General methodology (generic example)

### Project-Specific Patterns → Project Profile (e.g., `[project]-dev-preferences.md`)
Create project-specific profiles for domain-specific patterns:
- ✅ Project-specific extensions of generic patterns
- ✅ Domain jargon and specialized gotchas

**Logic**: Generic patterns in `dev-profile-patterns.md` are reusable. Domain-specific extensions go in your project profile.

---

## How This Works

Each developer has unique preferences for:
- **Response style**: How direct/polite/detailed?
- **Code patterns**: Which architectural patterns to emphasize?
- **Communication**: Show working? Explain assumptions?

**Example**: One developer prefers direct, technical language with complete code examples. Another might prefer more context and detailed explanations. Both are valid.

---

## Using Your Profile in Agents

Reference your profile in `.github/agents/[your-name].agent.md`:

```yaml
---
name: Development Agent
inheritsFrom: [your-name]-profile.md
---

# Your agent instructions...
```

Or in `.github/copilot-instructions.md`:

```markdown
See [.github/agents/references/[your-name]-profile.md](.github/agents/references/[your-name]-profile.md) for personal response preferences.
```

---

## Sharing & Adapting

These profiles are **not** team mandates. They're **personal preferences** that help:
- New agents understand your style
- Team members collaborate with aligned expectations
- Onboarding docs explain "how we work here"

Feel free to adapt, mix, and create new profiles as your team evolves.
