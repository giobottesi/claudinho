# Curiosity: Research & Design Thinking

For the curious mind—why claudinho exists, how it compares to other approaches, and the thinking behind it.

---

## Quick Navigation

- **[Design Philosophy](#design-philosophy)** — Why we built this way
- **[Comparison with Other Frameworks](#comparison-with-other-frameworks)** — vs Custom GPTs, LangChain, etc.
- **[Agent Landscape (March 2026)](#agent-landscape-march-2026)** — Full survey of how people structure AI agents
- **[Cost & Limits](#cost--limits)** — GitHub API, Copilot subscription, scaling questions

---

## Design Philosophy

claudinho is intentionally **simple, shareable, and extensible**—not a platform or framework.

### What Problems Does It Solve?

**Problem 1: Generic AI assistance**  
Without context, Copilot asks generic questions and suggests generic code.

**Problem 2: Onboarding friction**  
New engineers spend weeks learning "how we do things here."

**Problem 3: Knowledge silos**  
Team learnings about gotchas, integrations, patterns stay in people's heads.

### Our Solution

- **Code scanning**: Auto-detect 80% of context (tech stack, file org, naming patterns)
- **5 human questions**: Capture what code can't know (gotchas, jargon, debugging style)
- **Shareable output**: Commit `.github/copilot-instructions.md` to your repo
- **Result**: Every engineer's Copilot understands your codebase immediately

### Design Principles

We built this around **simplicity and shareability**:

- **Markdown-first**: You own the files, commit to git, use any tools. No vendor lock-in.
- **Local-first**: Everything happens in your IDE. No backend required.
- **Framework-agnostic**: Works with Rails, Python, Node, Rust, Go, etc. Not opinionated about your stack.
- **Extensible**: People can create custom skills (`.github/skills/your-skill/SKILL.md`) in their own repos.

Think of it like `LICENSE` or `CODE_OF_CONDUCT.md`—a shareable convention that establishes norms for how your team + AI assistant work together.

---

## Comparison with Other Frameworks

### Custom GPTs (OpenAI)

**What**: Upload a prompt file, get a chatbot

**How it works**: Stores prompt in OpenAI's system

**vs claudinho**:
- ChatGPT is powerful but not integrated into your IDE (lives in browser, not your IDE)
- Generic, not code-aware (doesn't understand your codebase)
- claudinho: Integrated into VS Code, scans your actual codebase

### Copilot Extensions (GitHub, Feb 2025)

**What**: Backend service API that Copilot calls

**Examples**: Ollama integration, DuckDB connections, Sentry

**vs claudinho**:
- Extensions: Powerful for dynamic data (but require backend server and DevOps)
- claudinho: Pure markdown, no backend needed, zero infrastructure

### LangChain Agents

**What**: Python framework for building multi-tool AI systems

**vs claudinho**:
- LangChain: Powerful orchestration but needs Python runtime and steep learning curve
- claudinho: Zero-setup markdown files, built into VS Code, no runtime needed

### Prompt.Engineering Repos

**What**: Collections of prompts for different domains

**vs claudinho**:
- Prompt repos: Searchable but generic (not aware of your specific codebase)
- claudinho: Scans your code, personalizes to your patterns and conventions
### Quick Comparison

Here's how claudinho compares to other frameworks:

| Framework | Setup | Strength | Tradeoff |
|---|---|---|---|
| **claudinho** | 5 min | Simplest, shareable, local-first | Purpose-built for IDE context only |
| **Copilot Extensions** | 4h+ | Powerful, dynamic | Needs backend, complex |
| **Custom GPTs** | 5 min | Easy to share | Not IDE-integrated |
| **LangChain** | 4h+ | Sophisticated orchestration | Steep learning curve |
| **Prompt repos** | 5 min | Great for learning | Generic, not project-aware |

**Our bet**: Most teams don't need complex backends. They need their Copilot to understand *their specific codebase*. claudinho does that in 5 minutes.

Early feedback welcome—this is a work in progress.  

---

## Agent Landscape (March 2026)

As of now, there's **no standard pattern yet** for agent/skill frameworks. The design space is new.

### Pattern 1: Backend Service (Most Common in Production)

**Architecture:**
```
Claude (E2B, LangChain)
    ↓
Express/FastAPI Server (handles tool calls)
    ↓
Your Tools (file system, APIs, etc.)
```

**Tradeoffs:**
- ✅ Scalable (1000s concurrent requests)
- ✅ Full control (custom logic)
- ❌ Complex (requires DevOps)
- ❌ Privacy concerns (code sent to server)
- ❌ Latency (network round-trips)

**Examples**: LangChain agents, Copilot Extensions (DuckDB, Ollama)

### Pattern 2: Markdown Instructions (claudinho)

**Architecture:**
```
Your .md file (instructions)
    ↓
Copilot Chat (built-in, no server)
    ↓
Code suggestions
```

**Tradeoffs:**
- ✅ Simple (just markdown)
- ✅ Private (no server, local context)
- ✅ Zero latency (native VS Code)
- ❌ Static (can't dynamically update)
- ❌ Limited (no tool calling beyond built-in)

**Examples**: Copilot custom instructions, claudinho

### Pattern 3: Prompt Library (ChatGPT Custom GPTs)

**Architecture:**
```
Your prompt + docs (stored in OpenAI)
    ↓
ChatGPT UI
    ↓
"Expert in X" assistant
```

**Tradeoffs:**
- ✅ Easy (upload & share)
- ✅ No coding needed
- ❌ Siloed (only in ChatGPT, not IDE)
- ❌ Not code-aware (generic context)

**Examples**: ChatGPT store, OpenAI Custom GPTs

### Pattern 4: Hybrid (Emerging)

**Architecture:**
```
Local markdown context (like claudinho)
    ↓
+ Lightweight MCP server (for dynamic data)
    ↓
Smarter suggestions
```

**Tradeoffs:**
- ✅ Smart (dynamic + static)
- ✅ Private (optional local server)
- ✅ Extensible (add tools as needed)
- ❌ More complex than pure markdown

**Examples**: Some early MCP setups (postgres-mcp-server, etc.)

### Possible Future Extensions (Not Planned)

If teams wanted more, they could:

1. **Add an MCP server** (optional backend for dynamic data)
   ```
   claudinho (markdown)
   + postgres-mcp-server (for schema info)
   + file-search-mcp (for finding code)
   ```

2. **Add tool integrations** (Slack, Jira, Linear)
   ```
   claudinho context
   + Slack MCP (get current incidents)
   + Linear MCP (get sprint status)
   ```

3. **Add code analysis** (AST, dependency graphs)
   ```
   claudinho context
   + dependency-graph-analyzer
   + unused-code-detector
   ```

But these are **optional add-ons**. Core system works without them.

### Why claudinho Uses Markdown

We chose markdown because:

1. **Immediate velocity**: Works today, no infrastructure
2. **Team focus**: Solves "how does Copilot understand MY code?"
3. **Low barrier**: Anyone can edit a markdown file
4. **Privacy**: Your codebase context never leaves your machine
5. **Extensible**: Easy to add skills / tools later if needed

**We're NOT:**
- Trying to build a LangChain competitor (that needs backend)
- Reinventing Custom GPTs (we're IDE-native)
- Creating SaaS (intentionally simple)

**We ARE:**
- Solving the onboarding problem (new devs + Copilot understanding)
- Making agent context shareable (commit to git)
- Keeping it simple (markdown files only)

---

## Cost & Limits

### TL;DR

**Using Copilot in claudinho does NOT use extra GitHub API limits.**

- Copilot is the Claude model running inside Copilot Chat (already included in your subscription)
- GitHub API limits are different (for GitHub REST/GraphQL APIs)
- Cost: **Included in your Copilot subscription** (~$20/month or $200/year)

### GitHub API Rate Limits

**What**: REST/GraphQL API for interacting with GitHub (repos, issues, PRs, etc.)

**Limits**:
- 60 requests/hour (unauthenticated)
- 5,000 requests/hour (authenticated)

**Has nothing to do with**: Copilot model used, token counts, or Claude versions

### Claude Models (Sonnet, Opus, Haiku)

**What**: AI models that power Copilot Chat responses

**Costs**:
- Included in GitHub Copilot subscription ($20/month, $200/year)
- No per-request charges
- No per-token charges for subscribers

**Using Sonnet vs Haiku**:
- Same price (both included in subscription)
- Sonnet is smarter, slightly slower
- Haiku is faster, less capable
- Developers don't choose—Copilot team does

### Real Costs

| Component | Cost | Notes |
|-----------|------|-------|
| **GitHub Copilot** | $20/month | Covers all models, all tools |
| **VS Code** | Free | Open source |
| **claudinho setup file** | Free | Markdown in your repo |
| **Running /setup-agent** | Free | Included in Copilot subscription |
| **Using Copilot suggestions with context** | Free | Your existing subscription |

**Total**: $20/month (or $200/year with discount)

### Scaling Considerations

**If you share this with 100 developers:**
- Copilot subscription is per-person
- Each dev pays ~$20/month for their own subscription
- No additional GitHub API quota needed
- No backend servers to pay for

**If your team adds a backend service later** (optional):
- Each call = small token cost
- Anthropic APIs: ~$0.003 per 1K input tokens
- But you don't need a backend—system works today

---

## Frequently Asked Questions

**Q: Why not just use LangChain?**  
A: LangChain is great for orchestration but adds complexity. We're solving a simpler problem: "teach Copilot about my codebase."

**Q: Can we run this offline?**  
A: Yes. Code scanning is local. Copilot Chat requires internet (same as any VS Code feature).

**Q: What if I want to add backend integrations later?**  
A: Totally optional. Core system (agent + skills) works without it. You can layer MCP servers on top when needed.

**Q: Is this just prompts dressed up in markdown?**  
A: No—the core innovation is **code scanning + human input**. We auto-detect 80% of context from your repo. The 5 questions capture what static analysis can't know (gotchas, debugging style, team jargon).

**Q: Why not use OpenAI's Custom GPTs?**
A: Custom GPTs are powerful but not IDE-integrated and not code-aware. We solve "teach VS Code Copilot about my specific codebase."

---

**Still curious?** Clone the repo and run `/setup-agent` on claudinho itself. See how it describes itself.
