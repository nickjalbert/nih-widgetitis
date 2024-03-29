#!/usr/bin/env python
"""
Run black code formatter on tracked Python files. Requires Python >=3.6.

To use::

  # Format all code
  $ python scripts/format_code.py

  # Format specific files
  $ python scripts/format_code.py [path/to/file1] [path/to/file2]

  # Print files that will be formatted, but don't actually format
  $ python scripts/format_code.py --check
"""

import os
import sys
from pathlib import Path
from subprocess import PIPE, STDOUT, run

from shared import root_dir, traverse_tracked_files

returncode = 0

IGNORED_FILES = []

CHECK_ARG = "--check"


def format_file(path):
    extension = os.path.splitext(path)[1]
    if extension != ".py":
        return
    black_cmd = ["black", "--line-length=79", path]
    _run_command(path, black_cmd)
    isort_cmd = ["isort", "-m" "VERTICAL_HANGING_INDENT", "--tc", path]
    _run_command(path, isort_cmd)


def _run_command(path, cmd):
    global returncode
    if CHECK_ARG in sys.argv:
        cmd.append("--check")
    result = run(cmd, stdout=PIPE, stderr=STDOUT)
    returncode = returncode | result.returncode
    out = result.stdout.decode("utf-8")
    if out:
        print(path)
        print(out)
        print()


check_count = 1 if CHECK_ARG in sys.argv else 0

if len(sys.argv) - check_count > 1:
    for arg in sys.argv[1:]:
        if arg == "--check":
            continue
        path = Path(arg).absolute()
        format_file(path)
else:
    traverse_tracked_files(root_dir, format_file, IGNORED_FILES)
sys.exit(returncode)
