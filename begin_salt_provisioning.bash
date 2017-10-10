#!/usr/bin/env bash

# Begin provisioning
sudo salt '*' state.highstate

python3 /srv/salt/python_webserver/webserver.py &
echo -e "\nReady!\n"
echo "Try this from your host:"
echo "$ curl http://localhost:8080/now
$ curl http://localhost:8080/later
$ curl -X INVALID_METHOD http://localhost:8080/now
$ curl -X POST -F nam=wrongForm http://localhost:8080/later
$ curl -X POST -F name=foo http://localhost:8080/later
$ curl -X POST -F name=foo.bar http://localhost:8080/later
$ curl -X POST -F name= http://localhost:8080/later
$ curl -X PUT -F name= http://localhost:8080/later
$ curl -X PUT -F foo=bar http://localhost:8080/check
$ curl http://localhost:8080/check

Alternatively, you can use www.getpostman.com
"