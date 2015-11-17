# -*- coding: utf-8 -*-

require 'spec_helper'

describe service 'glances' do
  it { should be_running }
end

describe file '/etc/default/glances' do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

describe file '/etc/init.d/glances' do
  it { should be_file }
  it { should be_executable }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
