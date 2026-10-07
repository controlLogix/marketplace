# Output format

Use this file in steps 5 to 7 of `SKILL.md`.

## Optimized prompt template

Use these section headings in this order. Leave out a section only if it has nothing true to say.

```
## Goal
<One or two sentences: what to achieve and why.>

## Context
<Facts gathered from the environment: real paths, names, versions, current state.
Name each source, such as "from CLAUDE.md".>

## Constraints
<Rules and limits that apply. Quote project rules by name or number.>

## Deliverables
<What to produce, in what format, for whom.>

## Definition of done
<Measurable checks that prove the work is complete and correct.>

## Assumptions
<Anything assumed because the user skipped a question. The user can correct these.>

## Before you start
Interview me before you begin. Ask targeted questions about any details, information or
decisions you still need, including anything this prompt does not cover. Wait for my
answers, then start the work.
```

The "Before you start" section is required in every optimized prompt. Keep its wording. You may add one sentence naming the areas where questions are most likely.

## Plain language (ISO 24495-1:2023)

Write each optimized prompt to the four governing principles of the plain-language standard:

1. **Relevant:** the reader (the agent that will carry out the prompt) gets what it needs. Include what bears on the task. Leave out the rest.
2. **Findable:** the reader can find what it needs. Use the headings above, short lists and one idea per bullet.
3. **Understandable:** the reader understands what it finds. Use familiar words and short, direct sentences in the active voice. Define each term once and use it the same way throughout.
4. **Usable:** the reader can act on it. Each deliverable and check is concrete enough to do and to verify.

Follow the spelling and language rules in the user's instruction files, if they state any. Otherwise, use American English.

## Default presentation (format 1)

Show:

1. A heading: **Optimized prompt**
2. The optimized prompt in one fenced code block, so the user can copy it.
3. A heading: **What changed**
4. Three to seven bullets. Each names one gap closed or one fact or rule added, and where it came from (the user's answer, a file, or an assumption).

Then offer the menu from step 7 of `SKILL.md`.

## Diff presentation (format 2)

Show this only when the user chooses **Show as a diff**. Use a two-column table:

| Original | Optimized |
| --- | --- |
| <original text, or "(not stated)"> | <the matching part of the optimized prompt> |

Use one row per section of the optimized prompt. If the original said nothing for a section, write "(not stated)". After the table, offer the menu again.
