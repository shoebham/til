### Category python

---

 - [Access Instance Variables](#access-instance-variables)
 - [Create A Dummy DataFrame In Pandas](#create-a-dummy-dataframe-in-pandas)
 - [Test A Function With Pytest](#test-a-function-with-pytest)

---

# Access Instance Variables

You can define instance variables when instantiating a class.

```python
class Person:
    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name

    def full_name(self):
        return self.first_name + " " + self.last_name
```

Then those instance variables can be accessed as properties of that class
instances.

```python
me = Person("Josh", "Branchaud")

print(me.first_name) #=> "Josh"
print(me.full_name()) #=> "Josh Branchaud"
```

# Create A Dummy DataFrame In Pandas

[Pandas](https://pandas.pydata.org/pandas-docs/stable/index.html) has all kinds
of utilities for pulling in and processing tabular data. You can pull in a
bunch of data from a SQL database into a `DataFrame`. This `DataFrame` object
is then something you could pass around, process, and read from.

When you are sketching out an implementation or writing some tests, it may not
be feasible to read data from a DB. Instead, you can create a little dummy
`DataFrame` using the
[`from_dict`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.from_dict.html#pandas.DataFrame.from_dict)
function.


```python
import pd

data = {'pokemon': ['Charmander', 'Squirtle', 'Bulbasaur'], 'type': ['Fire', 'Water', 'Grass']}
pd.DataFrame.from_dict(data)
```

This creates a two column `DataFrame` with a `pokemon` header and a `type`
header. The two lists of value will be matched up positionally, so `squirtle`
will be paired with `water`.

# Test A Function With Pytest

The [`pytest` framework](https://docs.pytest.org/en/latest/index.html) is a
solid choice for unit testing your python project.

Any file whose name is preceeded with `test_` that contains functions whose
names are preceeded with `test_` will be processed and executed by the pytest
test runner.

```python
# test_taco.py

def taco(day):
  return "Taco " + day

def test_taco_tuesday():
  assert taco("Tuesday") == "Taco Tuesday" # passes

def test_taco_blank():
  assert taco("") == "Taco" # fails, missing trailing space
```

Use `assert` statements to check that a comparison is `true`. If it isn't the
`assert` statement will result in a test failure with some output about what
went wrong.

Ensure you have `pytest` installed and then run the following from your project
directory:

```bash
$ pytest
#=> ... you'll see the test output below
```

