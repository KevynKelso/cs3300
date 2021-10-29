#!/usr/bin/env python3
import re
import sys


def main(args):
    if len(args) < 2:
        print("USAGE: change_ruby_version.py <version_num>")
        return

    version = args[1]
    content = ""
    with open("./Gemfile", "r") as f:
        content = f.read()

    content = re.sub(r"ruby '\d\.\d\.\d'", f"ruby '{version}'", content)

    with open("./Gemfile", "w") as f:
        f.write(content)


if __name__ == "__main__":
    main(sys.argv)
