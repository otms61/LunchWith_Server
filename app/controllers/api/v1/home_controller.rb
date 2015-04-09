class Api::V1::HomeController < Api::V1::ApplicationController
  def index
    @coupons = @user.university.coupons
  end
end
