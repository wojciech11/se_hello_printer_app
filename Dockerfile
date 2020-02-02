FROM python:2.7

ARG APP_DIR=/home/tester/Desktop/Karol-tester/se_hello_printer_app

WORKDIR /tmp
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p $APP_DIR
ADD hello_world/ $APP_DIR/hello_world/
ADD main.py $APP_DIR

CMD PYTHONPATH=$PYTHONPATH:/home/tester/Desktop/Karol-tester/se_hello_printer_app \
FLASK_APP=hello_world flask run --host=0.0.0.0
