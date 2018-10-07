from notes.models import NotesEntry
import datetime
import os
import fnmatch

path_to_repo = '/home/cyamo/mysite/static/notes/'

for course_code in os.listdir(path_to_repo + '1A/'):
  for filename in fnmatch.filter(os.listdir(path_to_repo + '1A/' + course_code), '*-*-*.md'):
    date = datetime.datetime.strptime(filename[:10], "%Y-%m-%d").date()
    note_entry = NotesEntry()
    note_entry.course_code = course_code
    note_entry.date = date
    note_entry.title = filename[10:-3]
    note_entry.filename = filename[:-3]
    note_entry.save()

