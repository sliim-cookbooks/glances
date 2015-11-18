# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'glances::service' do
  let(:subject) do
    ChefSpec::SoloRunner.new do |node|
      node.set['glances']['service']['RUN'] = true
      node.set['glances']['service']['DAEMON_ARGS'] = '--server'
    end.converge(described_recipe)
  end

  it 'includes recipe[glances]' do
    expect(subject).to include_recipe('glances')
  end

  it 'creates template[/etc/default/glances]' do
    expect(subject).to create_template('/etc/default/glances')
      .with(source: 'glances.default.erb',
            owner: 'root',
            group: 'root',
            mode: '0644')
    [/^DAEMON_ARGS=--server$/, /^RUN=true$/].each do |m|
      expect(subject).to render_file('/etc/default/glances').with_content(m)
      end
  end

  it 'creates template[/etc/init.d/glances]' do
    expect(subject).to create_cookbook_file('/etc/init.d/glances')
      .with(source: 'init_script.erb',
            owner: 'root',
            group: 'root',
            mode: '0755')
  end

  it 'enables service[glances]' do
    expect(subject).to enable_service('glances')
  end

  it 'starts service[glances]' do
    expect(subject).to start_service('glances')
  end
end
