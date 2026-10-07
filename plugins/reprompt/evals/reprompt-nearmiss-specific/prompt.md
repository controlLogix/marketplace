---
max_turns: 12
timeout_seconds: 300
allowed_tools: [Read, Glob, Grep, Skill]
runs: 3
tags: [nearmiss]
---

In src/config.ts, rename the exported constant MAX_RETRIES to MAX_RETRY_COUNT and
update its two imports in src/client.ts and src/worker.ts. Tell me the exact edits;
don't apply them.

This is a non-interactive run: no one can answer a question tool. If you would ask
the user questions, write them in your reply and stop. Do not change any files or run
shell commands. Do not read eval case files or grading rubrics.
