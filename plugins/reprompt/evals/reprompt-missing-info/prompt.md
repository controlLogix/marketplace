---
max_turns: 12
timeout_seconds: 300
allowed_tools: [Read, Glob, Grep, Skill]
runs: 3
tags: [auto, missing-info]
---

Help me plan deploying the app to the box, I want to get it done this week without breaking anything.

This is a non-interactive run: no one can answer a question tool. If you would ask
the user questions, write them in your reply and stop. Do not change any files or run
shell commands. Do not read eval case files or grading rubrics.
