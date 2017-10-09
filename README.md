DRAFT / WiP

# DevOps Coding Challenge

##### CHANGELOG

- Upgraded to Debian 9 (Salt 2016 Carbon)
- Fixed ~/.ssh/config: /vagrant/srv/.../bob_rsa **->** /srv/.../bob_rsa
- Fixed saltmaster.bash: chmod 400... **->** sudo chmod 400...
- Added python3-pip and installed sqlalchemy
- Added [Bottle](https://bottlepy.org/docs/dev/) (Python framework) for the webserver implementation

## Instructions

### Salt cluster

1. The external dependencies are Vagrant and VirtualBox:
- Vagrant 2: https://www.vagrantup.com/downloads.html
- VirtualBox 5.1.28: https://www.virtualbox.org/wiki/Downloads
2. Clone the repository
3. `$ vagrant up`
4. `$ vagrant ssh saltmaster`
5. `$ sudo salt ‘*’ state.highstate`
6. At this point the _Nginx VM_ is fully provisioned and the _PostgreSQL VM_ has the system user account created
for Bob and added him to the sudo group
7. For SSH access convenience, minions are configured in the `~/.ssh/config` file for the`vagrant` user
on `saltmaster`
8. The password for the SSH key is: bobob
9. To remove the VMs: `$ vagrant halt; vagrant destroy`

### Webserver

The premises given in the challenge can be tested using curl, [Postman](http://www.getpostman.com) (or any tool alike) or a web browser.

1. Inside the local cloned repository (or within _Salt master VM_), go to `srv/salt/python_webserver/` and launch the web server: `$ python3 webserver.py`
2. Examples of curl requests:
```
$ curl http://localhost:9000/now
$ curl http://localhost:9000/later
$ curl -X INVALID_METHOD http://localhost:9000/now
$ curl -X POST -F nam=wrongForm http://localhost:9000/later
$ curl -X POST -F name=foo http://localhost:9000/later
$ curl -X POST -F name=foo.bar http://localhost:9000/later
$ curl -X POST -F name= http://localhost:9000/later
$ curl -X PUT -F name= http://localhost:9000/later
etc.
```
(Click to enlarge) - [webserver.py]https://github.com/i90rr/salt-cluster/blob/master/srv/salt/python_webserver/webserver.py)
![webserver](https://raw.githubusercontent.com/i90rr/salt-cluster/master/extras/webserver.png)

3. PENDING: database reachability check (I need to figure out how to establish a connection to the DB)

