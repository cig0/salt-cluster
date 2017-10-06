DRAFT / WiP

# salt-cluster

#### CHANGELOG

- Upgraded to Debian 9 (Salt 2016 Carbon)
- Fixed ~/.ssh/config: /vagrant/srv/.../bob_rsa -> /srv/.../bob_rsa
- Fixed saltmaster.bash: chmod 400... -> sudo chmod 400...
- Added python3-pip and installed sqlalchemy
- Added Bottle.py framework and webserver implementation in `/srv/salt/python_webserver/{bottle.py,webserver.py}`

## Testing webserver.py

- The premises given in the challenge can be tested using curl, a tool like Postman (http://getpostman.com) or any web browser.

1. Clone the repository, access `srv/salt/python_webserver` and launch the web server: `$ python3 webserver.py`
2. Examples of curl requests:
```
$ curl http://localhost:9000/now
$ curl http://localhost:9000/later
$ curl -X INVALID_METHOD http://localhost:9000/now
$ curl -X POST -F nam=wrongForm http://localhost:9000/later
$ curl -X POST -F name=foo http://localhost:9000/later
$ curl -X POST -F name=foo.bar http://localhost:9000/later
etc.
```
(Click to enlarge)
![webserver](https://raw.githubusercontent.com/i90rr/salt-cluster/master/extras/webserver.png)

3. Pending: database reachability check (I need to figure out how to establish a connection)
