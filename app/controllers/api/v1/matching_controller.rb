class Api::V1::MatchingController < Api::V1::ApplicationController
  before_action :should_be_arrange_time, unless: :arrange_time?

  def create
    times = params[:times]
    @user.update_attributes(status: :post_arrange_time)
    @user.save_matching_times(times) unless times.nil?
    @user.do_arrange_time unless @user.matched_user.matching_times.empty?
  end

  private

  def should_be_arrange_time
    message = { error: 1, message: 'you are not arrange time state' }
    render json: message, status: :bad_request
  end

  def arrange_time?
    @user.arrange_time?
  end
end
