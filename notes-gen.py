from notes.models import NotesEntry
import datetime
import os
import fnmatch

# pull from repo
os.chdir('/home/cyamo/mysite/notes-repo')
os.system('git pull')

NotesEntry.objects.all().delete()

path_to_repo = '/home/cyamo/mysite/notes/static/notes/'

pk = 1

# colormap
cm = {}
cm['CS 135'] = '#0095CA'
cm['ECON 206'] = '#18B580'
cm['MATH 135'] = '#cf4050'
cm['MATH 145'] = '#cec331'
cm['SPCOM 100'] = '8f79e6'

for course_code in os.listdir(path_to_repo + '1A/'):
  for filename in fnmatch.filter(os.listdir(path_to_repo + '1A/' + course_code), '*-*-*.md'):
    date = datetime.datetime.strptime(filename[:10], "%Y-%m-%d").date()
    note_entry = NotesEntry()
    note_entry.pk = pk
    note_entry.course_code = course_code
    note_entry.color = cm[course_code]
    note_entry.date = date
    note_entry.title = filename[10:-3]
    note_entry.filename = filename[:-3]
    note_entry.save()
    pk += 1

os.chdir('/home/cyamo/mysite')
# os.system('source env/bin/activate')
os.system('echo yes | python manage.py collectstatic')
