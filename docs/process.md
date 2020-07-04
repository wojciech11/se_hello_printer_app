Instrukcja dla nowych czlonkow zespolu:

1. Utwórz fork z repozytorium: https://github.com/7kaza/se_hello_printer_app  

2. Sklonuj repozytorium w nowo utworzonym katalogu:

$ mkdir -p ~/hello_world_printer
$ cd ~/hello_world_printer
$ git clone https://github.com/7kaza/se_hello_printer_app

3. Uruchom aplikację, według instrukcji README.md

4. Po uruchomieniu aplikacji otwórz w przeglądarce adres 127.0.0.1:5000

5. Zamiast przeglądarki wykorzystaj narzędzie curl w konsoli bash:  

$ curl 127.0.0.1:5000
$ curl 127.0.0.1:5000/outputs
$ curl 127.0.0.1:5000/?output=json

6. Uruchom testy według poleceń z README.md  


W naszym projekcie wykorzystalismy:
- system kontroli wersji Git - GitHub oraz GitLab
- narzedzia do Continuous Integration - TravisCI oraz Jenkins
- aplikacje do wirtualizacji, która umożliwia stworzenie kontenera na
 platformie DSM zawierajacego nasza aplikacje wraz potrzebnym srodowiskiem - Docker Hub
- platforme chmurowa stworzona w modelu PaaS (Platform as a Service) do publikacji
naszej aplikacji - HEROKU
- narzedzie do monitorowania aplikacji webowej - StatusCake

Mozemy wyroznic nastepujace etapy tworzenia oprogramowania:
-tworzenie kodu
-testy jednostkowe
-testy integracyjne
-budowanie i publikowanie APLIKACJI
