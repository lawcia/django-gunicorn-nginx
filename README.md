# Django - gunicorn - nginx App

Django app setup using a wsgi server (gunicorn) and a web server (nginx)

Requirements

1. Vagrant
2. Docker

## Getting started

In the root directory enter this command to start the development vm

```vagrant up```

Open your browser and enter this url

```http://localhost:8090/polls/```

The response should be

```Hello, world. You're at the polls index.```

## To manage the development vm

Connect to the machine

```vagrant ssh```

The project code will be in this location

```ls /vagrant```

Destroy machine

```vagrant destroy```

## Notes:

### Calculate number of cores in linux machine

```grep -c ^processor /proc/cpuinfo```

### Calculate recommended number of workers

```num_of_workers = (2 * num_cores) + 1```

add number of workers in /conf/gunicorn_config.py

### Supervisor

After installing supervisor create a .conf file in this dir on the linux machine, so that supervisor can manage the process ```/etc/supervisord.conf```

Check the status
```sudo django_env/bin/supervisorctl status```

