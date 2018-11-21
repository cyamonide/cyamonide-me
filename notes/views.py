from django.shortcuts import render, get_object_or_404
from .models import NotesEntry

# Create your views here.
def notes_list(request):
  notes = NotesEntry.objects.order_by('course_code', '-date')
  return render(request, 'notes/notes_list.html', {'notes': notes})

def notes_detail(request, course, filename):
  notes = NotesEntry.objects.filter(course_code = course, filename = filename)
  pk = notes[0].pk
  note = get_object_or_404(NotesEntry, pk=pk)
  note.convert()
  return render(request, 'notes/notes_detail.html', {'note': note})
