Simple Flask App
================

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć 
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Rozpocząnając pracę z projektem (wykorzystując virtualenv). Hermetyczne środowisko dla pojedyńczej aplikacji w python-ie:

  ::

    source /usr/local/bin/virtualenvwrapper.sh # do ~/.bashrc
    mkvirtualenv wsb-simple-flask-app
    pip install -r requirements.txt
    pip install -r test_requirements.txt

- Uruchamianie applikacji:

  :: 

    # jako zwykły program
    python main.py

    # albo:
    PYTHONPATH=. FLASK_APP=hello_world flask run

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ::

    PYTHONPATH=. py.test
    PYTHONPATH=. py.test  --verbose -s

- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ::

    source /usr/bin/virtualenvwrapper.sh # nie trzeba, jeśli już w .bashrc
    workon wsb-simple-flask-app


- Integracja z TravisCI:

  ::

    ...


Pomocnicze
==========

- Instalacja python virtualenv i virtualenvwrapper:

  ::

    yum install -y python-pip
    pip install -U pip
    pip install virtualenv
    pip install virtualenvwrapper
  
- Instalacja docker-a:

  :: 

    yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

    yum install -y yum-utils

    yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

    yum makecache fast
    yum install -y docker-ce
    systemctl start docker

- Travis
   ::
	Travis odpali wszystkie skrypty po kolei i zdeployuje apke nawet jezeli testy nie przeszly.
	Zeby tak nie bylo, trzeba zmienic i dac make deps && make lint, a nie jedno pod drugim


Materiały
=========

- https://virtualenvwrapper.readthedocs.io/en/latest/
