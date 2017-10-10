/home/bob/webserver.py:
  file:
    - managed
    - source: salt://python_webserver/webserver.py
    - user: bob
    - group: users
    - mode: 644
