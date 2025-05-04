#Pytest file containing tests for the python parser

import pytest
import parso
from utils import is_valid_python_prefix

good_codes = ["x=5", "x=", "if 25>3:", "def foo(a):",
                "if x:\n  print", "def bar(x, y):\n  x,y="]

bad_codes = ["x===", "def foo(a):\n\tx=\nfoo(5)"]

@pytest.mark.parametrize("code", good_codes)
def test_good_code(code):
    assert is_valid_python_prefix(code)

@pytest.mark.parametrize("code", bad_codes)
def test_bad_code(code):
    assert not is_valid_python_prefix(code)
