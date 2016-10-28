run:
	@gunicorn --bind 0.0.0.0:8000 --daemon django_sample.wsgi
