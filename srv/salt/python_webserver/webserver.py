#!/usr/bin/env python3

import datetime
import json
import psycopg2
import sys
from bottle import error, get, post, response, request, run

@error(404)
def custom404(error):
    return 'Wrong URL, accepted endpoints are: /now, /later, /check'

@error(405)
def custom405(error):
    response.status = 401
    return json.dumps({"error": "invalid method"})

@get('/now')
def now():
    return "Current date and time is " + '{0:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())

@post('/later')
def later():
    if request.method == 'POST' and 'name' in request.POST:
        name = request.forms.get("name")
        if name == '':
            response.status = 402
            return json.dumps({"error": "invalid name", "payload": name})
        elif name.isalnum():
            return json.dumps({"status": "ok"})
        else:
            response.status = 402
            return json.dumps({"error": "invalid name", "payload": name})

    response.status = 402
    return json.dumps({"error": "name=foo is the only valid param"})

@get('/check')
def check():
    con = None
    try:
        con = psycopg2.connect("dbname='plugdj' user='plugdj' password='plugdj'")
        cur = con.cursor()
        cur.execute('SELECT version()')
        #print(cur.fetchone())
    except psycopg2.DatabaseError as e:
        response.status = 403
        #print('Error %s' % e)
        return
    finally:
        if con:
            con.close()
            
run(host='localhost', port=9000, debug=True)
