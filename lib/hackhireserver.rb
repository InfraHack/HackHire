require 'fog'
require 'rubygems'
require 'excon'
Excon.ssl_verify_peer = false

class HackHireServer
	def initialize(image)
		images = {'redhat' => 'ami-12663b7a', 'ubuntu' => 'ami-d05e75b8'}
		
		@compute = Fog::Compute.new(
			:provider				        => 'AWS',
			:aws_access_key_id		  => 'AKIAIDNLXJR57FAVC4FQ',
			:aws_secret_access_key	=> '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'
		)
		@server = @compute.servers.create(:image_id => images[image], :flavor_id=> 't2.micro', :name => 'my_server')
		@server.wait_for { ready? }
	end
	
	def cleanup
		@server.destroy
	end
end
