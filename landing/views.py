from django.shortcuts import render
from django.http import FileResponse, Http404

# Create your views here.

def landing(request):
  return render(request, 'landing/landing.html', {})

def resume(request):
  try:
    return FileResponse(open('/home/cyamo/mysite/static/documents/resume.pdf', 'rb'), content_type='application/pdf')
  except FileNotFoundError:
    raise Http404()
