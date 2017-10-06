bob:
  user.present:
    - name: bob
    - shell: /bin/bash
    - uid: 4000
    - gid: 100
    - groups:
      - sudo
      - cdrom
      - floppy
      - audio
      - dip
      - video
      - plugdev
      - netdev

/etc/sudoers.d/bob:
  file:
    - managed
    - source: salt://users/bob
    - user: root
    - group: root
    - mode: 440
