#!/usr/bin/env python
"""Accept or keep revisions within a LaTeX file."""

import re
from pathlib import Path


def find_matching_brace(text: str, start: int) -> int:
    """Find the position of the closing brace corresponding to a opening brace.

    Args:
        text: Text containing two matching braces.
        start: Position in the text of the considered opening brace.

    Returns:
        Position in the text of the corresponding closing brace.
    """
    depth = 0
    for i in range(start, len(text)):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if depth == 0:
                return i
    msg = "The given brace is not closed."
    raise ValueError(msg)


def extract_args(text: str, pos: int, n_args: int) -> tuple[list[str], int]:
    """Extract arguments of a LaTeX command.

    Args:
        text: Text containing the considered command.
        pos: Starting position of the command.
        n_args: Number of arguments taken by the command.

    Returns:
        The arguments of the command, with the position in the text of the first
        charecter after the closing brace of the command.
    """
    args = []
    for _ in range(n_args):
        start = text.index("{", pos)
        end = find_matching_brace(text, start)
        args.append(text[start + 1 : end])
        pos = end + 1
    return args, pos


def resolve_revisions(text: str, /, *, accept: bool = True) -> str:
    """Accept or keep revisions within a LaTeX text.

    Args:
        text: Content of a LaTeX file.
        accept: Automatically accept revisions.

    Returns:
        The LaTeX content with accepted revisions (i.e. without the commands and
        with the appropriate content).
    """
    pattern = re.compile(r"\\(adNi|rmNi|rpNi)\{")
    out = []
    pos = 0
    while True:
        m = pattern.search(text, pos)
        if not m:
            out.append(text[pos:])
            break
        out.append(text[pos : m.start()])
        cmd = m.group(1)
        n_args = 2 if cmd == "rpNi" else 1
        args, end_pos = extract_args(text, m.start(), n_args)

        if cmd == "adNi":
            out.append(args[0] if accept else "")
        elif cmd == "rmNi":
            out.append("" if accept else args[0])
        elif cmd == "rpNi":
            out.append(args[0] if accept else args[1])

        pos = end_pos
    return "".join(out)


if __name__ == "__main__":
    import sys

    with Path(sys.argv[1]).open() as f:
        content = f.read()
    accept = "--reject" not in sys.argv
    print(resolve_revisions(content, accept=accept))  # noqa: T201
