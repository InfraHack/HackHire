require 'fog'
require 'rubygems'
require 'excon'
Excon.ssl_verify_peer = false

class VirtualServer
	def initialize(image)
		@compute = Fog::Compute.new(
			:provider				=> 'AWS',
			:aws_access_key_id		=> 'AKIAIDNLXJR57FAVC4FQ',
			:aws_secret_access_key	=> '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'
		)
		@server = @compute.servers.create(:image_id => image, :flavor_id=> 't2.micro', :name => 'my_server')
		@server.wait_for { ready? }
		@server.ssh_ip_address
	end
	
	def cleanup
		@server.destroy
	end
end
