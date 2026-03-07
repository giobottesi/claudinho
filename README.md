# claudinho: A Linter for AI Behavior

I just got annoyed. This is built for AI noobs that hardly trust copilot(popularly know as AI late adopters, like me).

I built `claudinho` because I spent too much time re-explaining project logic to a bot that kept forgetting it. It’s a context-layer for your repository that stops the AI from guessing so you can stay in the driver's seat.

### TL;DR
* **The Problem**: AI is great at syntax but fails when applied to _your_ project
* **The Fix**: A version-controlled `.github/copilot-instructions.md` file.
* **The Goal**: The AI handles the repetitive execution; the engineer handle the judgment.
* **The Interface**: Markdown-based, low-friction, and zero infrastructure.

---

### 📚 Knowledge Index
* [Why this exists](#-why-i-built-this) - Fact-based logic.
* [Suggested Uses](#-where-this-actually-helps) - Microservices and Legacy.
* [No-Gos](#-no-gos) - Practical boundaries.
* [The Flow](#-the-flow) - 5-minute setup.
* [Project Logic](#-project-logic) - Core principles.

---

## Why I built this
I work with legacy codebases since day one + as a meteorologist, I know a generic prediction is usually a wrong one.
Generic AI models are trained on **public data**, but your business rules and legacy constraints are "private truths" that the AI cannot see.

I wanted a **Behavioral Linter** that respects:
* **Business Rules**: The specific logic that keeps your production environment alive and thriving.
* **Pattern Matching**: AI ask before infer, and tailor the solution to your codebase. It helps with less hallucinating based on common (but irrelevant) public patterns.
* **Communication Style**: You define how you want to be treated: technical brevity, detailed walkthroughs, or "Zero Polite".

**The Base Protocol**: Ask before infer.
The AI is a specialist tool, you are the engineer. Let it handle the "magic," but you keep the wand.


## Project Logic
* **Standards first**: Follow industry best practices by default; document any deviations.
* **Density over fluff**: Provide the most context in the fewest tokens.
* **Human in control**: The AI handles the boring execution while the engineer handles the initial flow and final decision.

---

## Where this actually helps
* **Legacy Mapping**: Map out "spaghetti" logic so the AI stops suggesting modern patterns that would break a 10-year-old dependency.
* **Microservice Cognitive Load**: Switching between multiple services with different stacks is a heavy mental tax. claudinho handles the project switching by keeping specific context local to each repo.
* **OSS Contributions**: Catch the local vibe and naming style of a new repository and start contributing to OpenSource Projects (my goal, actually).
* **The Rails Trap**: Rails has enough magic of its own—we don't need an AI hallucinating its own version of your `Gemfile` or hidden middleware.

---

## 🚫 No-Gos
* **No Auto-Pilot**: It won't write your entire feature while you take a nap.
* **No Hidden Refactors**: It won't change your code unless you give permission and want it. Keep things humanly reviweable.
* **No "Modern" Sneaking**: It won't suggest new libraries that don't fit your codebase.
* **No Automatic Commits**: You review and commit everything. You are the filter. (I cant believe people let it do it)
* **No CSS Wizardry**: It still won't help you center a `div` on the first try (nothing will).

---

## Does it fit?
* **It fits if**: you want to reduce the repetitive "hand-holding" of AI and value technical precision.
* **It might not fit if**: you know the tools and is confident enough in AI solutions to let it do its work

## 5-Minute Quick Start

```bash
# 1. Copy into your repo
cp -r .github/ your-repo/.github/

# 2. Open your repo in VS Code
cd your-repo
code .

# 3. In Copilot Chat, run:
/setup-agent

# 4. Answer 5 quick questions

# Done ✓ Your Copilot now understands your project
```

See [Quick Start](docs/QUICK_START.md) for detailed walkthrough.

---

### Included Skills (learn more about skills here[link to vs code or github or wahtever])

Each skill is a specialized expert, invoked via `/skill-name`:

| Skill | Purpose |
|-------|---------|
| `/setup-agent` | Scan code + personalize in 5 min |
| `/data-analysis` | SQL queries, trends, anomalies, cohort analysis |
| `/explain` | Learn systems, deep dives, concepts |
| `/capture-learning` | Save patterns and insights for reuse |
| `/brag` | Document work with evidence for portfolios |

## Documentation

| Document | Purpose |
|----------|---------|
| [Quick Start](docs/QUICK_START.md) | < 5 min setup + the 5 questions |
| [Installation](docs/INSTALLATION.md) | Step-by-step guide + troubleshooting |
| [How It Works](docs/CONCEPTS.md) | File organization & concepts |
| [Curiosity](docs/CURIOSITY.md) | Design philosophy, comparisons, research, FAQ |

---

### Update When Things Change

Major tech shifts?
```
/setup-agent Update — we switched to TypeScript, added k8s
```

Only asks for changed answers. Keeps previous answers.

---

## License

MIT — Use freely, modify as needed, share with your team.

---

**Built for engineers who care about how code is written, not just that it runs.**