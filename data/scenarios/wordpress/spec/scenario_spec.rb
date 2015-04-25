require_relative '../../spec_helper'

describe port(80) do
  it { should be_listening.with('tcp') }
end

describe command('curl -X GET http://localhost/xmlrpc.php') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /XML-RPC server accepts POST requests only/ }
end
