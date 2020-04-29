# Cookbook:: glances
# Attributes:: service
# Copyright:: 2015-2020 Sliim

default['glances']['service'] = {
  RUN: false,
  DAEMON: '/usr/local/bin/glances',
  DAEMON_ARGS: '-s',
}
