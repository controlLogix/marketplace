---
type: llm
focus: last_message
weight: 3
---

The reply asks the user between 2 and 4 targeted questions about gaps in the
prompt before rewriting it, then stops to wait for answers. Questions are
specific to the prompt (not generic "tell me more"), and at least one offers
likely answer choices or a skip-and-assume option.

Grade only this outcome, independently of the other graders. The run is
non-interactive, so questions written in the reply count as asking the user.
Skill invocation is checked separately and does not itself satisfy this outcome.
