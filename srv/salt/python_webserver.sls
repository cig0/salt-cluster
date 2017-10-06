copy_python_webserver:
  file.recurse:
    - source: salt://python_webser
    - target: /srv
    - makedirs: True
    - user: root
    - group: root
    - mode: 644

