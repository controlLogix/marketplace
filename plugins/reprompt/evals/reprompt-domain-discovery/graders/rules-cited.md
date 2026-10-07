---
type: llm
focus: last_message
weight: 4
---

The reply reads the project's instruction file and brings its rules into the
questions or rewrite. It mentions at least two of these project rules: back up
before modifying, a compile gate before a large structural refactor, the runtime
target Linux SL 4.21, or never modifying the fastUpdate block. Generic advice
that does not reflect these specific rules fails.

Grade only this outcome, independently of the other graders. The run is
non-interactive, so questions written in the reply count as asking the user.
Skill invocation is checked separately and does not itself satisfy this outcome.
