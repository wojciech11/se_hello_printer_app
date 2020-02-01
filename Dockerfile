FROM python:2.7

ARG APP_DIR=/usr/src/hello_world_printer

WORKDIR /tmp
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p $APP_DIR
ADD hello_world/ $APP_DIR/hello_world/
ADD main.py $APP_DIR

CMD PYTHONPATH=$PYTHONPATH:/usr/src/hello_world_printer \
  FLASK_APP=hello_world flask run --host=0.0.0.0
