require 'kitchen/driver/docker'
module Kitchen
  module Driver
    class Docker < Kitchen::Driver::SSHBase
      def generate_keys
        return unless config[:public_key] && config[:private_key]
        if !File.exist?(config[:public_key]) || !File.exist?(config[:private_key])
          private_key = OpenSSL::PKey::RSA.new(2048)
          blobbed_key = Base64.encode64(private_key.to_blob).gsub("\n", '')
          public_key = "ssh-rsa #{blobbed_key} kitchen_docker_key"
          File.open(config[:private_key], 'w') do |file|
            file.write(private_key)
            file.chmod(0600)
          end
          File.open(config[:public_key], 'w') do |file|
            file.write(public_key)
            file.chmod(0600)
          end
        end
      end
    end
  end
end
