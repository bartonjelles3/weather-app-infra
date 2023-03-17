'Queries OpenWeatherMap for current temperature based on ZIP'

from owm_key import API_KEY
import flask
import requests

application = flask.Flask(__name__)

@application.route('/weather_query', methods=['POST'])
def weather_query():
    'Takes ZIP, queries OWM for latitude, longitude to request current temp in location.'
    req = flask.request.get_json()
    req_zip = req['zip']
    try:
        location_resp = requests.get(f'http://api.openweathermap.org/geo/1.0/zip?zip={req_zip},US&appid={API_KEY}')
        location_resp.raise_for_status()
    except requests.exceptions.HTTPError as err:
        raise SystemExit(err)
    
    lat, lon = location_resp.json()['lat'], location_resp.json()['lon']

    try:
        weather_resp = requests.get(f'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&units=imperial&appid={API_KEY}')
        weather_resp.raise_for_status()
    except requests.exceptions.HTTPError as err:
        raise SystemExit(err)
    
    temp = weather_resp.json()['main']['temp']
    return flask.jsonify({'temperature': temp})

if __name__ == '__main__':
    application.run(host="0.0.0.0", port=8081)

