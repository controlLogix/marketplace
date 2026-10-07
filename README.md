# controllogix

Claude Code plugin marketplace.

| Plugin | What it is |
| ------ | ---------- |
| `reprompt` | Rewrites a rough prompt into a stronger one: finds missing context and blind spots, interviews you, and offers to run the optimized prompt. Works in Claude Code, Codex, Grok and any SKILL.md-aware agent. See [plugins/reprompt](plugins/reprompt/README.md). |

## Install

This repository is private. Get read access first, then set up git credentials once on each machine:

```bash
gh auth login
gh auth setup-git
```

Then, in Claude Code:

```
/plugin marketplace add controlLogix/marketplace
/plugin install reprompt@controllogix
```

If the install summary says `Run /reload-plugins to activate.`, run that.
