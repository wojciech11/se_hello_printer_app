import unittest
import json
from hello_world import app
from hello_world.formater import SUPPORTED
from dicttoxml import dicttoxml
import xmltodict


XML_EXP = "<greetings><name>Natalia</name><msg>Hello World!</msg></greetings>"


class FlaskrTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()

    def test_outputs(self):
        rv = self.app.get('/outputs')
        ','.join(SUPPORTED) in rv.data

    def test_msg_with_output(self):
        imie = "Natalia"
        expected = {"imie": imie, "msg": "Hello World!"}
        rv = self.app.get('/?output=json&imie=' + imie)
        js = json.loads(rv.data)
        self.assertEqual(expected["imie"], js["imie"])
        self.assertEqual(expected["msg"], js["msg"])

    def test_msg_with_xml_output(self):
        imie = "Natalia"
        exp = {"imie": imie, "msg": "Hello World!"}
#        xml = xmltodict.parse(exp)
#        print(xml)
        rv = self.app.get('/?output=xml&imie' + imie)
        xml_create = dicttoxml(exp)
        print(xml_create)
        self.assertEquals(exp["imie"], xml_create[9])
        self.assertEquals(exp["msg"], xml_create[1])

    def test_msg_with_output_name(self):
        imie = 'Bartosz'
        rv = self.app.get('/?name=' + imie + '&output=json')
        self.assertEquals('{"imie": ' + '"' + imie + '"' +
                          ', "msg": "Hello World!"}', rv.data)
