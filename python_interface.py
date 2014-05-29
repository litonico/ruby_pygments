import os
from sys import stdin, stdout, stderr
from ast import literal_eval

import pygments
from pygments import lexers, formatters

try:
    # Get the data from Ruby
    data = literal_eval(sys.stdin.read())
    code = data['code']

    # Use Pygments' native functions to lookup lexers and formatters
    lexer = lexers.get_lexer_by_name(data['lexer'])
    formatter = formatters.get_formatter_by_name(data['formatter'])

    # Make sure there's nothing in stdout before we write
    stdout.flush()
    # Send everything back to Rubyland!
    stdout.write(pygments.highlight(code, lexer, formatter))

# If something bad happens in Python, Ruby should know about it
except Exception as e:
    stderr.flush()
    stderr.write(str(e))
