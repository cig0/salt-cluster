postgres:
  use_upstream_repo: True
  version: '9.5'
  pkg: postgresql
  pkgs_extra: []
  pkg_client: postgresql-client
  pkg_dev: postgresql-devel
  pkg_libpq_dev: postgresql-libs
  python: python-psycopg2
  user: postgres
  group: postgres

  prepare_cluster:
    command: initdb --pgdata=/var/lib/pgsql/data
    test: test -f /var/lib/pgsql/data/PG_VERSION
    user: postgres
    env: {}

  conf_dir: /var/lib/pgsql/data
  postgresconf: ""

  pg_hba.conf: salt://postgres/templates/pg_hba.conf.j2
  acls:
    # "local" is for Unix domain socket connections only
    - ['local', 'all', 'all', 'peer']
    # IPv4 network segment connections:
    - ['host', 'all', 'all', '192.168.0.1/32', 'md5']
    # IPv6 local connections:
    - ['host', 'all', 'all', '::1/128', 'md5']

  config_backup: '.bak'

  service: postgresql

  bake_image: False

  users: {plugdj}
  tablespaces: {}
  databases: {pliugdj}
  schemas: {}
  extensions: {}