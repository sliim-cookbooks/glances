describe service 'glances' do
  it { should be_running }
end

describe file '/etc/default/glances' do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:mode) { should cmp '0644' }
end

describe file '/etc/init.d/glances' do
  it { should be_file }
  it { should be_executable }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
