#!/usr/bin/env python3

from flask import Flask
from flask.ext import restful
from flask_restful import reqparse
# Only used for HTTP status codes
import http.client as http

app = Flask("melod")
api = restful.Api(app)


class Artists(restful.Resource):
    def __init__(self):
        parser = reqparse.RequestParser()
        parser.add_argument('sort', type=str)
        parser.add_argument('artists_per_page', type=int)
        parser.add_argument('page', type=int)
        parser.add_argument('starts_with', type=str)
        self.parser = parser

    def get(self):
        args = self.parser.parse_args()
        print(args)
        # Return a list of available artists
        return {'artists': list(range(5))}


api.add_resource(Artists, '/artists')


if __name__ == '__main__':
    app.run(debug=True)
