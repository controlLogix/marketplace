# reprompt

reprompt turns a rough prompt into a stronger one before any work starts.

## What it does

1. It sorts your prompt into one or more types: planning, goal, or missing information.
2. It reads your local instruction files (such as `CLAUDE.md` or `AGENTS.md`) for paths, versions and rules that apply.
3. It asks you 2 to 4 targeted questions about the gaps that matter most.
4. It rewrites the prompt with a goal, context, constraints, deliverables and a definition of done. The rewrite always ends with an instruction to interview you before the work starts.
5. It offers four choices: **Send** (run the optimized prompt now), **Optimize further**, **Show as a diff**, or **Keep my original**.

The rewrite follows the plain-language standard ISO 24495-1:2023.

## How to use it

- Type `/reprompt <your prompt>`.
- Or just type a vague planning or goal request. reprompt starts on its own when a request is too vague to act on well.

## Install

| Host | How to install |
| --- | --- |
| Claude Code | `/plugin marketplace add controlLogix/marketplace`, then `/plugin install reprompt@controllogix` |
| Codex CLI | `codex plugin marketplace add <marketplace path or repo>`, then `codex plugin add reprompt@controllogix`. Codex reads `.agents/plugins/marketplace.json` and `.codex-plugin/plugin.json`. |
| Grok CLI | `grok plugin install <path to plugins/reprompt> --trust`, or `grok plugin marketplace add <marketplace>`. Grok reads the `.claude-plugin/` manifests. |
| Any other agent | See [AGENTS.md](AGENTS.md). |

To try it without installing, start Claude Code with `claude --plugin-dir plugins/reprompt`.

## Test it

The eval suite is in `evals/`. It has 8 cases: 6 that should use the skill (planning, goal, missing information, project rules, rewrite format and explicit request) and 2 near-misses that should not. Run it from the marketplace root:

```
claude plugin eval plugins/reprompt --judge-model sonnet --scaffold
```

- `--judge-model sonnet` is needed. The default judge model fails correct long answers.
- `--scaffold` runs `evals/reprompt-domain-discovery/scaffold.sh`, which copies the fixture project into the run's working directory.
