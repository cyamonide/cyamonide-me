# Django handbook
_This is where I take note of all the stuff I've learned._

## `manage.py`

To execute a Python script from the Django shell,
```bash
python manage.py shell < myscript.py
```

<hr>

## QuerySets

<hr>

To reverse the order of a QuerySet, prepend `-` to the field to search by.
```python
.order_by('-date')
```
[Source](https://stackoverflow.com/questions/1470676/how-can-i-tell-the-django-orm-to-reverse-the-order-of-query-results)

<hr>

To remove all objects belonging to a model:
```python
MyModelName.objects.all().delete()
```

<hr>

## Miscellaneous

Unix filename pattern matching uses Python lib `fnmatch`. Use `?` as a one character wildcard, and `*` for multiple characters.
```python
import fnmatch
wordlist = ['foobar', 'foobat', 'google', 'django']
filtered = fnmatch.filter(wordlist, 'foo*t')
```

<hr>

Listing contents of a directory using `os`:
```python
os.listdir()
os.listdir('~/.config/i3')
```

<hr>


