# -*- coding: utf-8 -*-
name 'glances'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache 2.0'
description 'Installs/Configures glances'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

recipe 'default', 'Installs/Configures glances'

depends 'python'

supports 'ubuntu', '>= 12.04'
supports 'debian', '>= 7.0'

source_url 'https://github.com/sliim-cookbooks/glances' if
  respond_to?(:source_url)
issues_url 'https://github.com/sliim-cookbooks/glances/issues' if
  respond_to?(:issues_url)
