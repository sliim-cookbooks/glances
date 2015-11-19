require 'kitchen/driver/docker'
module Kitchen
  module Driver
    class Docker < Kitchen::Driver::SSHBase
      def generate_keys
        return unless config[:public_key] && config[:private_key]
        super
      end
    end
  end
end
