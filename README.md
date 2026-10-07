# controllogix

Claude Code plugin marketplace.

| Plugin | What it is |
| ------ | ---------- |
| `reprompt` | Turns a rough prompt into a strong one before any work starts. It finds what is missing, asks you a few questions, and hands back a prompt with a clear definition of done. |

**Contents**

1. [What reprompt does](#1-what-reprompt-does)
2. [Install it](#2-install-it)
3. [Use it in 4 steps](#3-use-it-in-4-steps)
4. [A worked example](#4-a-worked-example)
5. [The four choices](#5-the-four-choices)
6. [When to use it, and when not to](#6-when-to-use-it-and-when-not-to)
7. [Tips](#7-tips)
8. [Troubleshooting](#8-troubleshooting)
9. [Update or remove it](#9-update-or-remove-it)

---

## 1. What reprompt does

A vague request makes the agent guess. It guesses the wrong system, misses a rule you already know, and builds the wrong thing. reprompt spends two minutes up front so the work is right the first time.

When you give it a prompt, it:

1. **Sorts the prompt.** Is it a plan, a goal with no way to measure it, or a request that is missing the target, version or environment?
2. **Reads your project rules.** It checks `CLAUDE.md`, `AGENTS.md`, `.cursor/rules` and similar files for real paths, versions and rules. It only reads. It changes nothing.
3. **Asks you 2 to 4 questions.** Only about the gaps that would change the result the most. Every question has a "skip" option.
4. **Rewrites the prompt.** The new prompt has a goal, context, constraints, deliverables, a definition of done, and a list of anything it assumed.
5. **Lets you choose.** Run the new prompt, improve it further, compare it with your original, or keep your original.

Nothing runs until you choose **Send**.

---

## 2. Install it

### Where it works

| Where you use Claude or another agent | Works? | How to install |
| --- | --- | --- |
| Claude Code (terminal) | Yes | [Option A](#option-a-claude-code-terminal-or-the-desktop-app-code-tab) |
| Claude desktop app, **Code** tab | Yes | [Option A](#option-a-claude-code-terminal-or-the-desktop-app-code-tab) |
| Claude desktop app or claude.ai, **chat** | Yes, with one limit | [Option B](#option-b-claude-desktop-chat-or-claudeai) |
| Cursor | Yes | [Option C](#option-c-cursor) |
| Codex CLI | Yes | [Option D](#option-d-codex-cli-grok-cli-and-other-agents) |
| Grok CLI | Yes | [Option D](#option-d-codex-cli-grok-cli-and-other-agents) |
| Any other agent that reads `SKILL.md` files | Yes | [Option D](#option-d-codex-cli-grok-cli-and-other-agents) |
| An agent with no skill support | Partly | [Option E](#option-e-agents-with-no-skill-support) |

### Before you start: get access

This repository is private. Ask the owner to add you as a collaborator first. Then, once on each computer, run:

```bash
gh auth login
gh auth setup-git
```

Options A and D need this. For Options B, C and E you only need to download files from this repository.

### Option A: Claude Code (terminal) or the desktop app Code tab

In Claude Code, type:

```
/plugin marketplace add controlLogix/marketplace
/plugin install reprompt@controllogix
```

If Claude Code says `Run /reload-plugins to activate.`, type `/reload-plugins`.

**Check it worked:** type `/reprompt`. It should appear in the command list.

### Option B: Claude desktop chat or claude.ai

The chat side of Claude does not use plugins. It uses uploaded skills instead.

1. Download [`dist/reprompt-skill.zip`](dist/reprompt-skill.zip) from this repository. Do not unzip it.
2. In Claude, open **Settings**, then **Capabilities**.
3. Make sure **Code execution and file creation** is turned on. Skills need it.
4. Under **Skills**, click **Upload skill** and choose the zip.
5. Turn the **reprompt** skill on.

**Check it worked:** start a new chat and type `reprompt this: plan the server migration`. Claude should ask you questions instead of writing a plan.

**The limit:** in chat, Claude cannot see your project files, so step 2 ("read your project rules") finds nothing. reprompt still works, but it asks more questions. Paste key facts into your prompt to make up for it.

### Option C: Cursor

1. Download or clone this repository.
2. Copy the folder `plugins/reprompt/skills/reprompt/` to **one** of these places:
   - `~/.cursor/skills/reprompt/` for all your projects
   - `.cursor/skills/reprompt/` inside one project, for that project only
3. Restart Cursor.

**Check it worked:** in Agent chat, type `/` and search for `reprompt`.

### Option D: Codex CLI, Grok CLI and other agents

| Agent | Install |
| --- | --- |
| Codex CLI | `codex plugin marketplace add controlLogix/marketplace`, then `codex plugin add reprompt@controllogix` |
| Grok CLI | Clone this repository, then `grok plugin install plugins/reprompt --trust` |
| Any agent that reads `SKILL.md` | Copy `plugins/reprompt/skills/reprompt/` to `~/.agents/skills/reprompt/` |

Restart the agent, then type `/reprompt <your prompt>`.

### Option E: agents with no skill support

Copy `plugins/reprompt/skills/reprompt/` somewhere on your computer. Then add this line to your project's `AGENTS.md` (or the agent's rules file):

```
When I ask you to reprompt, optimize or sharpen a prompt, follow the steps in <path>/reprompt/SKILL.md.
```

Replace `<path>` with the folder you copied it to. The agent follows the steps only when you ask for it by name. It does not start on its own.

---

## 3. Use it in 4 steps

**Step 1. Give it your prompt.** Use either way:

- Type `/reprompt` followed by your prompt:
  ```
  /reprompt deploy the app to the box
  ```
- Or just type a vague request. reprompt starts on its own when a request to plan, build, deploy, fix or improve something is too vague to act on.

**Step 2. Answer the questions.** You get 2 to 4 short questions. Pick an option, type your own answer, or choose **Skip, and use reasonable assumptions**. Skipped questions show up later under **Assumptions**, so you can check them.

**Step 3. Read the optimized prompt.** It appears in a code block with a short **What changed** list underneath. That list names each gap it closed and where each new fact came from.

**Step 4. Pick one of four choices.** Usually **Send**. See [The four choices](#5-the-four-choices).

---

## 4. A worked example

This shows what a session looks like. Your questions and output depend on your project.

**You type:**

```
/reprompt deploy the app to the box
```

**reprompt asks:**

```
1. Which app, and where is its code?
   a) The repo in this folder (Recommended)
   b) Another repo (tell me the path)
   c) Skip, and use reasonable assumptions

2. What is "the box"?
   a) A Linux server I reach over SSH
   b) A Windows server
   c) A cloud VM (AWS, Azure)
   d) Skip, and use reasonable assumptions

3. Is something already running there that must keep working?
   a) Yes, replace the running version with no downtime
   b) No, this is the first deploy
   c) Skip, and use reasonable assumptions
```

**You answer:** 1a, 2a (`10.0.0.12`, Ubuntu 22.04), 3a.

**reprompt returns:**

```
## Goal
Deploy the app in this repository to the Ubuntu 22.04 server at 10.0.0.12,
replacing the running version without downtime.

## Context
- Code: this repository (main branch).
- Target: Ubuntu 22.04 at 10.0.0.12, reached over SSH.
- A version is already running there and serving users.

## Constraints
- No downtime for current users.
- Keep the old version ready to switch back to.
- Back up before modifying the server (from CLAUDE.md, "back up first" rule).

## Deliverables
- A deploy script or step-by-step runbook.
- A rollback procedure.

## Definition of done
- The new version answers its health check on the server.
- The old version can be restored with one command.
- No requests failed during the switch.

## Assumptions
- None. All questions were answered.

## Before you start
Interview me before you begin. Ask targeted questions about any details,
information or decisions you still need, including anything this prompt does
not cover. Wait for my answers, then start the work.
```

**What changed**

- Named the target server and OS (your answer to question 2).
- Added "no downtime" and a rollback path (your answer to question 3).
- Added the backup rule (from `CLAUDE.md`).
- Added measurable checks for "done".

Then it offers the four choices.

---

## 5. The four choices

| Choice | What happens | Pick it when |
| --- | --- | --- |
| **Send** | The optimized prompt replaces yours and the work starts. The agent first asks any last questions. | The prompt looks right. This is the usual choice. |
| **Optimize further** | One more, deeper round on edge cases, failure modes, rollback and how to check the result. It may ask new questions. | The task is risky, touches production, or is hard to undo. |
| **Show as a diff** | A table of your original next to the optimized version, section by section. Then the choices again. | You want to see exactly what was added. |
| **Keep my original** | The rewrite is thrown away and your original prompt runs as written. | You only wanted to see the questions, or you disagree with the rewrite. |

---

## 6. When to use it, and when not to

**Use it for:**

- Plans, migrations, rollouts and designs: "plan the rollout", "migrate the database".
- Goals with no number: "make the HMI faster", "make it more reliable".
- Requests that name a thing but not which one or where: "deploy the app to the box", "update the firmware".
- Any task where a wrong guess is expensive to undo.

**Skip it for:**

- Requests that are already specific: "rename `x` to `y` in `main.py`".
- Quick questions: "what does this function do?"
- Optimizing code, queries or performance. reprompt optimizes **prompts**, not code.

If you run it on a request that is already clear, it says so in one sentence and offers to run it as is.

---

## 7. Tips

- **Put your rules in a file.** reprompt is much better when your project has a `CLAUDE.md`, `AGENTS.md` or `.cursor/rules` file with paths, versions and rules. It quotes those rules in the rewrite, so you do not have to repeat them.
- **Skip freely.** If you do not know an answer, skip it. The assumption is listed so you or a teammate can fix it later.
- **Save good prompts.** The optimized prompt is a plain code block. Copy it into a ticket or a doc to reuse it, or to hand the work to a teammate.
- **Use "Optimize further" for anything that touches production.** It adds rollback and verification steps.

---

## 8. Troubleshooting

| Problem | Fix |
| --- | --- |
| `/plugin marketplace add` fails with "not found" or asks for a password | You do not have access yet, or git has no credentials. Ask for collaborator access, then run `gh auth login` and `gh auth setup-git`. |
| `/reprompt` does not appear after install | Type `/reload-plugins`, or restart Claude Code. |
| It does not start on its own for a vague request | Type `/reprompt` in front of the request. Automatic start depends on how vague the request looks. |
| It starts when you did not want it | Choose **Keep my original**. Your prompt runs unchanged. |
| claude.ai rejects the zip | Check that **Code execution and file creation** is on, and upload `dist/reprompt-skill.zip` without unzipping or renaming it. |
| Cursor does not list it | Check that the path ends in `skills/reprompt/SKILL.md`, then restart Cursor. |

---

## 9. Update or remove it

**Claude Code:**

```
/plugin marketplace update controllogix
/plugin uninstall reprompt@controllogix
```

**Claude chat:** Settings, Capabilities, Skills. Delete the old skill, then upload the new zip.

**Cursor and other agents:** replace or delete the copied `reprompt` folder.

---

For how the skill works inside, and how to run its tests, see [plugins/reprompt/README.md](plugins/reprompt/README.md).
