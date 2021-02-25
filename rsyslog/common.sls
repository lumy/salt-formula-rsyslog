{%- from "rsyslog/map.jinja" import global with context %}


rsyslog_repository:
  pkgrepo.managed:
    - key_url: https://download.opensuse.org/repositories/home:rgerhards/{{ grains['os'] }}_{{ grains['osmajorrelease'] }}.0/Release.key
    - file: /etc/apt/sources.list.d/rsyslog.list
    - humanname: home:rgerhards.list
    - name: deb https://download.opensuse.org/repositories/home:/rgerhards/{{ grains['os'] }}_{{ grains['osmajorrelease'] }}.0/ /
    - gpgcheck: 1


rsyslog_packages:
  pkg.installed:
  - names: {{ global.pkgs }}
  - version: {{ global.version }}
  - hold: true

rsyslog_service:
  service.running:
  - enable: true
  - name: rsyslog
