import unittest
from hello_world import app
from hello_world.formater import SUPPORTED


class FlaskrTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()

    def test_outputs(self):
        rv = self.app.get('/outputs')
        s = str(rv.data)
        ','.join(SUPPORTED) in s

#    def test_msg_with_output(self):
#        rv = self.app.get('/?output=json')
#        test_data = {"imie": "Katarzyna", "msg": "Hello World!"}
#        y=json.loads(rv.data)
#        self.assertEqual(b'{test_data["msg"], y:["msg"]}', rv.data)
#        self.assertEqual(b'{test_data["imie"], y:["imie"]}', rv.data)
#        self.assertEqual(b'{ "imie":"Katarzyna", "mgs":"Hello World!"}', rv.data) # noqa
#       test ktory sprawdza ilosc pol.

    def test_msg_with_output(self):
        rv = self.app.get('/?output=xml')
        self.assertEqual(b'<greetings><name>' + b'Katarzyna' + b'</name><msg>' + b'Hello World!' + b'</msg></greetings>', rv.data) # noqa
