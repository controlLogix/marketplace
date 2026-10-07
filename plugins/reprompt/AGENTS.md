# Using reprompt in any agent

This file is for people who want to use reprompt in an agent that does not install plugins from a marketplace.

The skill is one folder: `skills/reprompt/`. It holds a `SKILL.md` file and a `references/` folder. It needs no scripts, packages or network access.

## Install as a skill

Copy the `skills/reprompt/` folder into the skills folder your agent reads. Common locations:

| Agent | User-level folder |
| --- | --- |
| Most agents that support `SKILL.md` | `~/.agents/skills/reprompt/` |
| Claude Code | `~/.claude/skills/reprompt/` |
| Grok CLI | `~/.grok/skills/reprompt/` (it also reads `~/.agents/skills/`) |

Codex installs reprompt as a plugin. See [README.md](README.md).

Restart the agent or reload its skills, then type `/reprompt <your prompt>`.

## Use without skill support

If your agent does not support skills, add this line to your project's `AGENTS.md`:

```
When I ask you to reprompt, optimize or sharpen a prompt, follow the steps in <path>/skills/reprompt/SKILL.md.
```

Replace `<path>` with the folder where you keep reprompt.
