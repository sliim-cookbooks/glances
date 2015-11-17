# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'glances::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new do |node|
      node.set['glances']['config'] = { cpu: { user_careful: 50 } }
    end.converge(described_recipe)
  end

  it 'includes recipe[python]' do
    expect(subject).to include_recipe('python')
  end

  it 'installs python_pip[glances]' do
    expect(subject).to install_python_pip('glances').with(version: nil)
  end

  it 'installs python_pip[pystache]' do
    expect(subject).to install_python_pip('pystache')
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
        node.set['glances']['version'] = '2.4.2'
      end.converge(described_recipe)
    end

    it 'installs python_pip[glances]' do
      expect(subject).to install_python_pip('glances').with(version: '2.4.2')
    end
  end
end
