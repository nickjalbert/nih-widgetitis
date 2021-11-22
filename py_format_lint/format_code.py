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
from subprocess import run
from subprocess import PIPE
from subprocess import STDOUT

from shared import root_dir
from shared import traverse_tracked_files

returncode = 0

# From root of repo e.g. "my_repo/templates/test.py",
IGNORED_FILES = []


def format_file(path):
    global returncode
    extension = os.path.splitext(path)[1]
    if extension != ".py":
        return
    cmd = ["black", "--line-length=79", path]
    if len(sys.argv) > 1 and sys.argv[1] == "--check":
        cmd.append("--check")
    result = run(cmd, stdout=PIPE, stderr=STDOUT)
    returncode = returncode | result.returncode
    out = result.stdout.decode("utf-8")
    if out:
        print(path)
        print(out)
        print()


if len(sys.argv) > 1:
    for arg in sys.argv[1:]:
        path = Path(arg).absolute()
        format_file(path)
else:
    traverse_tracked_files(root_dir, format_file, IGNORED_FILES)
sys.exit(returncode)
