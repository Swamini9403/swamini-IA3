import unittest
from app import AppHandler

class TestApp(unittest.TestCase):
    def test_app_handler_exists(self):
        self.assertTrue(callable(AppHandler.do_GET))

if __name__ == "__main__":
    unittest.main()
