import unittest
import weather

_WEBPAGE = """<!DOCTYPE html>
<html>
  <head>
    <title>Weather App</title>
  </head>
  <body>
    <h1>Weather App</h1>
    <form action="get_weather" method="get">
      <input type="text" name="zip" placeholder="Enter ZIP code">
      <button type="submit">Get Weather</button>
    </form>
    
  </body>
</html>"""

class WeatherAppTests(unittest.TestCase):
    def test_home_rendered(self):
        'test10'
        with weather.application.app_context():
          self.assertNotEqual(weather.home(), _WEBPAGE)

if __name__ == '__main__':
    unittest.main(failfast=True)