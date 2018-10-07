from django.db import models
from django.utils import timezone
import os

# Create your models here.
class NotesEntry(models.Model):
  course_code = models.CharField(max_length=255)
  date = models.DateField(default=timezone.now)
  title = models.CharField(max_length=255, blank=True)
  filename = models.CharField(max_length=255, default='')
  converted = models.BooleanField(default=False)
  template_name = models.CharField(max_length=255, default='', blank=True)

  def convert(self):
    # filename
    # filename = str(self.date) + ' ' + self.title
    filename = self.filename
    # markdown path
    mdpath = '/home/cyamo/mysite/static/notes/1A/' + self.course_code + '/' + filename + '.md'
    # html path
    htmlpath = '/home/cyamo/mysite/notes/templates/notes/1A/' + self.course_code + '/' + filename + '.html'
    # perform conversion
    os.system('/home/cyamo/mysite/env/bin/markdown2 "' + mdpath + '" > "' + htmlpath + '"')
    self.template_name = 'notes/1A/' + self.course_code + '/' + filename + '.html'
    # update conversion status
    self.converted = True
    self.save()
