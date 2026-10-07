# Blind-spot checklist

Use this checklist in step 3 of `SKILL.md`. For each type that applies, check whether the prompt or the gathered context answers each question. Each unanswered question is a candidate gap. Ask about the gaps that would change the result the most.

## Planning prompts

- **Scope:** what is included, and what is explicitly out of scope?
- **Starting point:** what exists today? What is the current version, state or baseline?
- **Phases and order:** what must happen first? Can anything run in parallel?
- **Dependencies:** which people, systems, approvals or other work does this depend on?
- **Risk and rollback:** what could go wrong, and how is each step undone?
- **Verification:** how will each phase be proved to work?
- **Deliverable:** is the output a document, a checklist, tickets or code? Who reads it?

## Goal prompts

- **Definition of done:** what measurable result counts as success?
- **Baseline:** what is the number or state today, and how was it measured?
- **Target:** what number or state is good enough?
- **Constraints:** what must not get worse (cost, safety, compatibility, other features)?
- **Deadline or budget:** how much time or effort is acceptable?
- **Owner:** who decides that the goal is met?

## Missing-information prompts

Ask about the target and the version first. They decide which system the work touches, so a wrong guess there does the most damage.

- **Target:** which system, device, project, file or environment?
- **Version:** which version of the software, runtime, library or standard?
- **Environment:** is it production, test, lab or local? Which operating system and shell?
- **Inputs and outputs:** what goes in, and what should come out, in what format?
- **Access:** what credentials, permissions or connections does the work need?
- **Audience:** who uses the result? What do they already know?

## Every prompt

- **Rules from context:** which instruction files or project rules apply? Common examples are "back up first", "confirm the runtime version", "compile before a large refactor", "never modify protected blocks" and language or style rules. Add each one as a constraint.
- **Safety:** can the work affect live equipment, production data or other people? If so, what safeguards are needed?
- **Reversibility:** which actions are hard to undo? Should they need confirmation?
- **Coordination:** are other agents or people working on the same files or systems? Do they need to be told, or does the work need to be claimed?
- **Unknown unknowns:** what would an expert in this domain ask that the user has not mentioned?
