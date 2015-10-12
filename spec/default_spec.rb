# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'glances::default' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes recipe[python]' do
    expect(subject).to include_recipe('python')
  end

  it 'installs python_pip[glances]' do
    expect(subject).to install_python_pip('glances')
  end

  it 'does not create template[/etc/glances]' do
    expect(subject).to_not create_template('/etc/glances')
  end

  context 'with configuration' do
    let(:subject) do
      ChefSpec::SoloRunner.new do |node|
        node.set['glances']['config'] = { 'cpu' => { 'user_careful' => 50 } }
      end.converge(described_recipe)
    end

    it 'creates template[/etc/glances]' do
      expect(subject).to create_template('/etc/glances')
        .with(source: 'glances.erb',
              owner: 'root',
              group: 'root',
              mode: '0644')
      [/^\[cpu\]$/, /^user_careful=50$/].each do |m|
        expect(subject).to render_file('/etc/glances').with_content(m)
      end
    end
  end
end
