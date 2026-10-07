---
max_turns: 12
timeout_seconds: 300
allowed_tools: [Read, Glob, Grep, Skill]
runs: 3
tags: [workflow]
---

Reprompt this for me: plan a migration of the CodesysLogger library to CodesysLoggerInterface.

I already know the answers you'll want: scope is the logger library and its three
consumer projects only, no behavior changes. Current version 1.4.2, target 2.0.0.
Rollback is reverting to the 1.4.2 library in each project. Done means all three
projects compile with zero errors and log output is unchanged in a lab run.
The deliverable is a phased checklist for me. Skip the questions and give me the
optimized prompt.

This is a non-interactive run: no one can answer a question tool. If you would ask
the user questions, write them in your reply and stop. Do not change any files or run
shell commands. Do not read eval case files or grading rubrics.
