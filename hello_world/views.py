from hello_world import app
from formater import get_formatted
from formater import SUPPORTED, PLAIN
from flask import request

moje_imie = "Natalia"
msg = "Hello World!"


@app.route('/')
def index():
    output = request.args.get('output')
    imie = request.args.get('name')
    if not output:
        output = PLAIN
    if not imie:
        imie = moje_imie
    return get_formatted(msg, imie,
                         output.lower())


@app.route('/outputs')
def supported_output():
    return ", ".join(SUPPORTED)
