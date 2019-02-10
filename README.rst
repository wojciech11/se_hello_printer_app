Simple Flask App
================

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć 
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Rozpocząnając pracę z projektem (wykorzystując virtualenv). Hermetyczne środowisko dla pojedyńczej aplikacji w python-ie:

  ::

    # centos, add to ~/.bashrc
    $ source /usr/bin/virtualenvwrapper.sh
    
    # ubuntu, add to ~/.bashrc
    $ source /usr/local/bin/virtualenvwrapper.sh

    # tworzymy hermetyczne środowisko dla bibliotek aplikacji:
    $ mkvirtualenv wsb-simple-flask-app
    $ pip install -r requirements.txt
    $ pip install -r test_requirements.txt

  Sprawdź: `documentację virtualenvwrappera <https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html>`_ oraz `biblioteki flask <http://flask.pocoo.org>`_.

- Uruchamianie applikacji:

  :: 

    # jako zwykły program
    $ python main.py

    # albo:
    $ PYTHONPATH=. FLASK_APP=hello_world flask run

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ::

    $ PYTHONPATH=. py.test
    $ PYTHONPATH=. py.test  --verbose -s

- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ::

    $ source /usr/local/bin/virtualenvwrapper.sh # nie trzeba, jeśli już w .bashrc
    $ workon wsb-simple-flask-app
    
    ...

    # deaktywacja virtualenv
    $ deactivate

- Integracja z TravisCI:

  ::

    ...


Pomocnicze
==========

Ubuntu
------

- Instalacja python virtualenv i virtualenvwrapper:

  ::

    $ sudo pip install virtualenv
    $ sudo pip install virtualenvwrapper

- Instalacja dockera: `dockerce howto <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_

Centos
------

- Instalacja python virtualenv i virtualenvwrapper:

  ::

    $ yum install -y python-pip
    $ pip install -U pip
    $ pip install virtualenv
    $ pip install virtualenvwrapper
  
- Instalacja docker-a:

  :: 

    $ yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

    $ yum install -y yum-utils

    $ yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

    $ yum makecache fast
    $ yum install -y docker-ce
    $ systemctl start docker

Materiały
=========

- https://virtualenvwrapper.readthedocs.io/en/latest/
