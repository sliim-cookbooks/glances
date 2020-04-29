# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'glances::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new do |node|
      node.override['glances']['config'] = { cpu: { user_careful: 50 } }
    end.converge(described_recipe)
  end

  it 'installs python_runtime[2]' do
    expect(subject).to install_python_runtime('2')
  end

  it 'installs python_package[glances]' do
    expect(subject).to install_python_package('glances').with(version: nil)
  end

  it 'installs python_package[pystache]' do
    expect(subject).to install_python_package('pystache')
  end

  it 'creates directory[/etc/glances]' do
    expect(subject).to create_directory('/etc/glances')
      .with(owner: 'root',
            group: 'root',
            mode: '0755')
  end

  it 'creates template[/etc/glances/glances.conf]' do
    expect(subject).to create_template('/etc/glances/glances.conf')
      .with(source: 'glances.conf.erb',
            owner: 'root',
            group: 'root',
            mode: '0644')
    [/^\[cpu\]$/, /^user_careful=50$/].each do |m|
      expect(subject).to render_file('/etc/glances/glances.conf')
        .with_content(m)
    end
  end

  context 'with package version' do
    let(:subject) do
      ChefSpec::SoloRunner.new do |node|
        node.override['glances']['version'] = '2.4.2'
      end.converge(described_recipe)
    end

    it 'installs python_package[glances]' do
      expect(subject).to install_python_package('glances').with(version: '2.4.2')
    end
  end
end
