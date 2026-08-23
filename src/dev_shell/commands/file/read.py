"""Read file contents."""

from ._shared import VALIDATOR, read_file


def cat(args):
    """Show the content of a file.

    Usage:
        cat <filename>
    """
    if not args:
        print("Usage: cat <filename>")
        return

    read_file(args[0])