require 'chefspec'
ChefSpec::Coverage.start!
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.platform = 'redhat'
  config.version = '6.5'
  config.formatter = :documentation
end
