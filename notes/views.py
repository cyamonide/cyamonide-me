from django.shortcuts import render, get_object_or_404
from .models import NotesEntry

# Create your views here.
def notes_list(request):
  return render(request, 'notes/notes_list.html', {})

def notes_detail(request, course, date, title):
  notes = NotesEntry.objects.filter(course_code = course, date = date, title = title)
  pk = notes[0].pk
  note = get_object_or_404(NotesEntry, pk=pk)
  note.convert()
  return render(request, 'notes/notes_detail.html', {'note': note})
