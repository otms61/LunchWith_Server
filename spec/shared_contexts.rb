require 'rspec_api_documentation/dsl'
RSpec.shared_context 'with current_user having valid Pantene access token' do
  pp 'hoge'
  let(:current_user) { FactoryGirl.create(:user) }

  before do
    # header 'Authorization', "Token token=\"#{current_user.access_token}\""
    # header 'Authorization', "Token token=#{current_user.access_token}"
  end
end
