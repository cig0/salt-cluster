nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - reload: True

/etc/nginx/sites-available/default:
  file:
    - managed
    - source: salt://nginx/default
    - user: root
    - group: root
    - mode: 644

