describe command 'glances --version' do
  its(:exit_status) { should eq 0 }
end

describe file '/etc/glances/glances.conf' do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:mode) { should cmp '0644' }
end
