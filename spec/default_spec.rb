require_relative 'spec_helper'

describe 'glances::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new do |node|
      node.override['glances']['config'] = { cpu: { user_careful: 50 } }
    end.converge(described_recipe)
  end

  it 'installs spython_runtime[3]' do
    expect(subject).to install_spython_runtime('3')
  end

  it 'installs spython_package[Glances]' do
    expect(subject).to install_spython_package('Glances')
      .with(version: '',
            runtime: '3')
  end

  it 'installs spython_package[pystache]' do
    expect(subject).to install_spython_package('pystache')
      .with(runtime: '3')
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

    it 'installs spython_package[Glances]' do
      expect(subject).to install_spython_package('Glances')
        .with(version: '2.4.2',
              runtime: '3')
    end
  end
end
