'Simple Flask app that displays the current temperature at a given ZIP.'
import flask
import requests
import json

application = flask.Flask(__name__)


@application.route('/')
def home():
    'Weather homepage.'
    return flask.render_template('home.html')

@application.route('/get_weather', methods=['GET'])
def get_weather():
    'Gets the weather via an API call to a backend that queries OpenWeatherMap.'
    data = {'zip': flask.request.args.get('zip')}
    headers = {'Content-Type': 'application/json'}
    response = requests.post("http://127.0.0.1:8081/weather_query",
                              data=json.dumps(data), headers=headers)
    return flask.render_template('home.html',
                                  temperature=int(response.json()['temperature']))


if __name__ == '__main__':
    application.run(host="0.0.0.0", port=8080)
