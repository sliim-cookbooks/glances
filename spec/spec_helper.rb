require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.log_level = :error
  config.platform = 'debian'
  config.version = '11'
end

ChefSpec::Coverage.start! { add_filter 'glances' }

require 'chef/application'
