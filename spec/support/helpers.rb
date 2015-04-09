require 'support/helpers/request_header'
require 'support/helpers/response_json'
RSpec.configure do |config|
  config.include RequestHeaders
  config.include ResponseJSON
end
