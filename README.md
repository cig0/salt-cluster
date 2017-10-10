# DevOps Coding Challenge - Instructions

### Setting up the environment

1. The external dependencies are Vagrant and VirtualBox:
- Vagrant 2: https://www.vagrantup.com/downloads.html
- VirtualBox 5.1.28: https://www.virtualbox.org/wiki/Downloads
2. Clone the repository
3. `$ vagrant up`; `$ vagrant ssh saltmaster`
5. Once inside the Salt master: `$ /vagrant/provision_minions_and_launch_webserver.bash`
6. At this point the environment should be fully provisioned and the setup ready to use
7. For SSH access convenience, minions are configured in the `~/.ssh/config` file for the`vagrant` user
on `saltmaster`
8. The password for the SSH key is: bobob
9. To remove the VMs: `$ vagrant halt; vagrant destroy`

### Hands-on

1. The premises given in the challenge can be tested using curl, a tool like [Postman](http://www.getpostman.com) or a web browser.
2. Finally, the full stack can be accessed from the host computer, from the Salt master and from the minions.
```
Example requests
----------------

$ curl http://localhost:8080/now
$ curl http://localhost:8080/later
$ curl -X INVALID_METHOD http://localhost:8080/now
$ curl -X POST -F nam=wrongForm http://localhost:8080/later
$ curl -X POST -F name=foo http://localhost:8080/later
$ curl -X POST -F name=foo.bar http://localhost:8080/later
$ curl -X POST -F name= http://localhost:8080/later
$ curl -X PUT -F name= http://localhost:8080/later
$ curl -X PUT -F foo=bar http://localhost:8080/check
$ curl http://localhost:8080/check
```

_Click to enlarge_

![webserver](https://raw.githubusercontent.com/i90rr/salt-cluster/master/extras/webserver.png)

![UpAndRunning](https://raw.githubusercontent.com/i90rr/salt-cluster/master/extras/dcc.png)
**Note:** the HTTP server now listens on the internal IP only. The above screenshots belong to earlier commits.

## Flow chart

![flowchart](https://raw.githubusercontent.com/i90rr/salt-cluster/master/extras/Flow%20chart.png)
