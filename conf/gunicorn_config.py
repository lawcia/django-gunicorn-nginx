command = '/django_env/bin/gunicorn'
pythonpath = '/vagrant/myproject'
bind = 'unix:/home/vagrant/myproject.sock'
workers = 3