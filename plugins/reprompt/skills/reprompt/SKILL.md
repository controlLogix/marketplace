---
name: reprompt
description: 'Rewrite a rough prompt into a stronger one before any work starts. It finds the missing context and blind spots, interviews the user about them, shows the optimized prompt, and offers to run it in place of the original. Use when the user types "/reprompt", or asks to "optimize", "improve", "sharpen", "rewrite" or "tighten" a prompt. Also use it on your own, before doing any work or asking your own clarifying questions, whenever a request to plan, build, migrate, roll out, deploy, fix or improve something is too vague to act on well. Signs: no scope, no target system or environment, no version, no measurable definition of done, or a goal with no baseline. Short complaints count ("make the HMI faster, it is sluggish", "plan the rollout", "deploy the app to the box", "clean up the alarms"). Do not use when the request is already specific and actionable, or when "optimize" refers to code, queries or performance rather than a prompt.'
user-invokable: true
argument-hint: '<prompt to optimize>'
---

# reprompt

This skill turns a rough prompt into one that an agent can carry out well the first time. You are the agent running it. The user is the person who wrote the prompt.

Write everything you show the user, questions included, in plain language. Follow any spelling rules in the user's instruction files. Otherwise, use American English.

A vague prompt is expensive. The agent guesses at scope, misses constraints the user already knows, and builds the wrong thing. It costs far less to spend two minutes on questions up front than to redo the work.

## The steps

Follow these steps in order. Do not start the task the prompt describes until the user chooses **Send**.

### 1. Classify the prompt

Decide which types apply. A prompt can be more than one type.

- **Planning:** it asks for a plan, migration, rollout, design or sequence of work.
- **Goal:** it states an outcome ("faster", "more reliable", "cleaner") without a way to measure it.
- **Missing information:** it names a thing without its target, version, environment, path, inputs or audience.

If the prompt is already specific and actionable, say so in one sentence. Offer to run it as is, or to optimize it anyway. Then stop. This matters most when the skill started on its own: a clear request should not be slowed down.

### 2. Gather context (read only)

Look for facts that ground the prompt in the user's real environment. Check these, when present:

- Instruction files: `CLAUDE.md`, `AGENTS.md`, `GEMINI.md`, `.grok/` rules, `.cursor/rules`, and any rules folder they point to.
- Session notes, a project catalog or a README that names the thing the prompt refers to.
- Files, paths, projects or tools the prompt names.

Collect real paths, names, versions and every rule that applies to the task. For example, a rule that says "back up before modifying" or "compile before refactoring" belongs in the rewrite as a constraint. Quote rules by their name or number so the user can check them.

Only read. Do not edit, run or install anything in this step. Keep it short: a few targeted reads, not a survey of the disk.

### 3. Find the blind spots

Read `references/blind-spots.md` and check the prompt against the list for each type you chose in step 1. Note each gap you find. Choose the gaps that would change the result the most. Leave out gaps that the context from step 2 already answers.

### 4. Interview the user

Ask 2 to 4 targeted questions about the most important gaps.

- For a missing-information prompt, the first question pins down the target: which thing, where it is, and which version (both the one there now and the one wanted). A wrong guess here sends the work to the wrong system.
- Each question asks one thing. If two gaps are related, choose the one that matters more, or combine them into a single choice with options. Do not stack sub-questions under one number: the user answers the first and skips the rest.
- Use the host's structured question tool if one exists (for example, `AskUserQuestion` in Claude Code). Otherwise, ask in plain text as a numbered list.
- Offer likely answers as choices where you can, with your recommended option first.
- Always include a way out: "Skip, and use reasonable assumptions." In a structured question tool, make it the last option on every question, so the user can skip one question without typing. Record each skipped question under Assumptions in the rewrite.
- Then **stop and wait** for the answers. Do not answer your own questions.

If the prompt already contains the answers, skip this step and say so.

### 5. Rewrite the prompt

Write the optimized prompt using the template in `references/output-format.md`. It has these sections: Goal, Context, Constraints, Deliverables, Definition of done, Assumptions, and the interview instruction.

Every optimized prompt must end with the interview instruction from the template, however complete the prompt looks. It tells the agent that carries out the prompt to interview the user about anything it still needs before it starts work. This protects against gaps that neither you nor the user saw.

Write the prompt in plain language (ISO 24495-1). Make it relevant, easy to find your way around, easy to understand, and easy to act on. `references/output-format.md` explains each principle.

### 6. Present the result

Show the result in the default format from `references/output-format.md`:

1. The optimized prompt, in one code block.
2. A short list under "What changed", naming each gap closed and each fact or rule added from context.

### 7. Offer the menu

Offer these choices, using the structured question tool if the host has one:

- **Send:** run the optimized prompt now, in place of the original.
- **Optimize further:** do one more, deeper round.
- **Show as a diff:** show the original and optimized prompts side by side.
- **Keep my original:** discard the rewrite and run the original prompt.

Handle the answer:

- **Send:** say "Running the optimized prompt." Then treat the optimized prompt as the user's request, and start with its interview instruction.
- **Optimize further:** focus on edge cases, failure modes, rollback and how to verify the result. Go back to step 3, ask any new questions, and present the new version. Keep the interview instruction.
- **Show as a diff:** use the diff format in `references/output-format.md`, then offer the menu again.
- **Keep my original:** run the original prompt as written.

## Working in different CLIs

This skill works in Claude Code, Codex, Grok and any agent that reads `SKILL.md` files. Tool names differ between hosts. Where this file names a tool, use the host's equivalent. If no equivalent exists, use plain text and wait for the reply.
