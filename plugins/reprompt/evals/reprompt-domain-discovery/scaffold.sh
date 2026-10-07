#!/usr/bin/env bash
# Copy the fixture project (rules file + POU) into the run's working directory.
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -R "$here/fixture/." .
