class Api::V1::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :restrict_access

  def restrict_access
    authenticate_or_request_with_http_token do |token, _options|
      @user = User.find_by(access_token: token)
    end
  end
end
