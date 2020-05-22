# Simple Flask App

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Badge StatusCake i TravisCI

TravisCl:
[![Build Status](https://travis-ci.org/7kaza/se_hello_printer_app.svg?branch=master)](https://travis-ci.org/7kaza/se_hello_printer_app)
StatusCake:
[![Uptime Button](https://app.statuscake.com/button/index.php?Track=Nk5fztn1S7&Days=1&Design=1)](https://app.statuscake.com/UptimeStatus.php?tid=5507337)


- Instalacja python virtualenv i virtualenvwrapper:
```
$ sudo pip install virtualenv
$ sudo pip install virtualenvwrapper
```


- W projekcie wykorzystamy virtual environment, dla utworzenia hermetycznego środowisko dla aplikacji:

  ```
  # tworzymy hermetyczne środowisko dla bibliotek aplikacji:
  $ python3 -m venv .venv

  # aktywowanie hermetycznego środowiska
  $ source .venv/bin/activate
  $ pip install -r requirements.txt
  $ pip install -r test_requirements.txt

  # zobacz
  $ pip list
  ```

  Sprawdź: [tutorial venv](https://docs.python.org/3/tutorial/venv.html) oraz [biblioteki flask](http://flask.pocoo.org).

- Uruchamianie applikacji:

przed utworzeniem pliku Makefile
  ```
  # jako zwykły program
  $ python main.py

  # albo:
  $ PYTHONPATH=. FLASK_APP=hello_world flask run
  ```
po utworzeniu pliku Makefile
```
$ make run
```

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

przed utworzeniem pliku Makefile
  ```
  $ PYTHONPATH=. py.test
  $ PYTHONPATH=. py.test --verbose -s
    ```
po utworzeniu pliku Makefile
```
$ make test
```

- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ```
  # deaktywacja
  $ deactivate
  ```
  ```
  # aktywacja
  $ source .venv/bin/activate
  ```

- Integracja z TravisCI:

  ```
  # miejsce na twoje notatki
    ```
 - Wykorzystanie platformy Heroku do hostowania aplikacji:

      Utworz konto na heroku.com

      Dodaj gunicorn do twojego pliku requirements.txt:  
          # aktywuj wcześniej virtualenv
          ```   
          $ echo 'gunicorn' >> requirements.txt  
          $ pip install -r requirements.txt
          ```
      Sprawdź czy requirements.txt się zgadza:
          ```  
          $ cat requirements.txt
          ```      
              flask              
              gunicorn

      Przetestuj działanie:  
        # w jednym oknie terminala
         ```
          $PYTHONPATH=$PYTHONPATH:$(pwd) gunicorn hello_world:app
         ```
         # w drugim oknie terminala
          ```
          $curl 127.0.0.1:8000
         ```

      Stwórz plik Procfile z jedną linią:  
          web: gunicorn hello_world:app

      Gdybyśmy mieli wymaganą specyficzną wersję pythona, trzeba byłoby dodać plik runtime.txt (sprawdź na: https://devcenter.heroku.com/articles/python-runtimes#supported-python-runtimes):
        ```
            $ touch runtime.txt
        ```      
            # dodaj python-3.6.10
        ```    
            $ cat runtime.txt
              python-3.6.10  
        ```       

      Zainstaluj Heroku CLI, korzystając z instrukcji na stronie:
        https://devcenter.heroku.com/articles/heroku-cli  

      Przetestuj plik Procfile z pomocą heroku-cli:
          # w jednym oknie terminala
            ```  
            $ heroku local
            ```
          # w drugim oknie terminala  
            ```
            $ curl 127.0.0.1:5000
            ```

      Umieśćmy aplikację na platformie Heroku:
        ```
            $ heroku login -i    
            $ heroku create
        ```    
        # aplikacja pojawi się w heroku dashboard (przeglądarka internetowa)
        # heroku działa używając git-a:
        ```  
            $ git remote -v  
        ```       
        # deploy  
        ```
            $ git push heroku master
        ```
 - Integracja TravisCI z Heroku:

      Umiesc na koncu pliku .travis.yml:
          deploy:      
              provider: heroku      
              app: NAZWA TWOJEJ APLIKACJI    
              api_key: ${HEROKU_API_KEY}

      W zakładce settings na travis-ci.org, dodaj zmienną HEROKU_API_KEY, klucz możemy pobrać w konsoli za pomocą:
          ```
            $ heroku auth:token  
          ```              

 - Dodanie prostego monitoringu aplikacji za pomoca StatusCake:

      Utworz konto na https://www.statuscake.com/
      Dodaj grupę kontaktową ze swoim email-em.
      Dodaj test:
        - URL: url Twojej aplikacji
        - Nazwa: dowolna
        - Contact Group.

 - Test coverage
     Dodaj pytest-cov, plugin do pytest, do analizy pokrycia testami kodu, do test_requirements.txt:  
     ```
         $ echo 'pytest-cov' >> test_requirements.txt  
         $ pip install -r test_requirements.txt
      ```

     Dodaj do pliku Makefile
     ```
       test_cov:
          $ PYTHONPATH=. py.test --verbose -s --cov=.
          $ PYTHONPATH=. py.test --verbose -s --cov=. --cov-report xml

       test_xunit :    
          $ PYTHONPATH=. py.test -s --cov=. --cov-report xml --junit-xml=test_results.xml  
      ```   
      Dodaj do .gitignore, aby git (git status) ignorował pliki: test_results.xml, coverage.xml i .coverage.

## Ubuntu - DOCKER

- Instalacja dockera: [dockerce howto](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

- Przetestuj, że możesz wrzucić swój Docker Image do docker huba:
```
$ export DOCKER_PASSWORD=TWOJE_HASLO
$ make docker_push
```
# zweryfikuj, że docker jest uruchomiony  
```
$ docker ps -a
```
Docker zazwyczaj nie restartujemy, kasujemy i uruchamiamy na nowo:
```
$ docker stop hello-world-printer-dev
$ docker rm hello-world-printer-dev  
$ make docker_run
```
# możemy uruchomić basha w naszym dockerze image
```
 $ docker run -it hello-world-printer /bin/bash
```
# uruchamiamy bash-a w działającym dockerze z naszą aplikacją:
```
 $ docker exec -it hello-world-printer-dev /bin/bash
 ```
 komendy do zatrzymania i uruchomienia ponownie dockera:  
 ```
 $ docker stop hello-world-printer-dev
 $ docker start hello-world-printer-dev
 ```
