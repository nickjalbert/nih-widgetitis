#!/usr/bin/env python
"""
Run flake8 linter on tracked Python files. Requires Python >=3.6.
To use::

  # Lint all files
  $ python scripts/lint_code.py

  # Lint specific files
  $ python scripts/lint_code.py [path/to/file1] [path/to/file2]
"""

import os
import sys
from pathlib import Path
from subprocess import run
from subprocess import PIPE

from shared import root_dir
from shared import traverse_tracked_files

returncode = 0

# From root of repo e.g. "my_repo/templates/test.py",
IGNORED_FILES = []


def flake_file(path):
    global returncode
    extension = os.path.splitext(path)[1]
    if extension != ".py":
        return
    cmd = ["flake8", "--max-line-length", "79", path]
    result = run(cmd, stdout=PIPE)
    returncode = returncode | result.returncode
    out = result.stdout.decode("utf-8")
    if out:
        print(path)
        print(out)
        print()


if len(sys.argv) > 1:
    for arg in sys.argv[1:]:
        path = Path(arg).absolute()
        flake_file(path)
else:
    traverse_tracked_files(root_dir, flake_file, IGNORED_FILES)
sys.exit(returncode)
