# Project rules

Rules are numbered. Lower numbers bind harder.

- RULE #-1: Never call set_pou_code without both the declaration and the implementation.
- RULE #-0.6: A large structural refactor requires a compile gate. Compile after each step and stop on the first error.
- RULE #-0.45: The runtime target is always Linux SL, version 4.21. Verify the version on each box.
- RULE #-0.05: Never modify the fastUpdate block.
- RULE #1: Back up the project before modifying anything.

## Project

- Project file: `project/AlarmStation.project`
- The alarm handling POU is `PRG_AlarmHandler`. It is about 600 lines of structured text and is called from the MainTask at 10 ms.
- The fastUpdate block lives inside `PRG_AlarmHandler`.
