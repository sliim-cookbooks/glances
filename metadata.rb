# -*- coding: utf-8 -*-
name 'glances'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache-2.0'
description 'Installs/Configures glances'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
chef_version '>= 12.5' if respond_to?(:chef_version)
version '1.0.6'

recipe 'default', 'Installs/Configures glances'
recipe 'service', 'Glances service for server setup'

depends 'poise-python'

supports 'ubuntu'
supports 'debian'
supports 'centos'
supports 'fedora', '< 22.0'

source_url 'https://github.com/sliim-cookbooks/glances' if
  respond_to?(:source_url)
issues_url 'https://github.com/sliim-cookbooks/glances/issues' if
  respond_to?(:issues_url)
