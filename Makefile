run:
	@gunicorn --bind 0.0.0.0:8000 --pid ~/.pids/python-jenkins.pid --daemon django_sample.wsgi
