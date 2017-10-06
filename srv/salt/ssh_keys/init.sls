bob_rsa:
  ssh_auth.present:
    - user: bob
    - source: salt://ssh_keys/bob_rsa.pub
    - config: '.ssh/authorized_keys'
    - enc: ssh-rsa
