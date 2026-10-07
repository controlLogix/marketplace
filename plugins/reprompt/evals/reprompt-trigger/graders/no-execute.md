---
type: llm
focus: last_message
weight: 2
---

The reply does not start the underlying task. It does not produce the plan,
migration steps, code or deployment commands the prompt describes. It stops
after asking questions or presenting an optimized prompt for approval.

Grade only this outcome, independently of the other graders. The run is
non-interactive, so questions written in the reply count as asking the user.
Skill invocation is checked separately and does not itself satisfy this outcome.
