---
max_turns: 12
timeout_seconds: 300
allowed_tools: [Read, Glob, Grep, Skill]
runs: 3
tags: [nearmiss]
---

Optimize this SQL query, it's taking 9 seconds on 2M rows:
SELECT * FROM orders o WHERE YEAR(o.created_at) = 2026 AND o.status IN
(SELECT status FROM order_status WHERE active = 1) ORDER BY o.created_at DESC;
Explain what to change and why.

This is a non-interactive run: no one can answer a question tool. If you would ask
the user questions, write them in your reply and stop. Do not change any files or run
shell commands. Do not read eval case files or grading rubrics.
