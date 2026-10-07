---
type: llm
focus: last_message
weight: 3
---

The optimized prompt itself contains an instruction telling the agent that will
carry it out to interview the user, asking about any details or information it
still needs, and to wait for answers before starting work. The instruction must
be inside the optimized prompt, not only in commentary around it.

Grade only this outcome, independently of the other graders. The run is
non-interactive, so questions written in the reply count as asking the user.
Skill invocation is checked separately and does not itself satisfy this outcome.
