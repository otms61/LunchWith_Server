class Api::V1::UserController < Api::V1::ApplicationController
  skip_before_action :restrict_access, only: [:create]

  def index
    @coupon = @user.coupon
    @friends = @user.friends
  end

  def create
    user = User.where(facebook_token: params[:facebook_token]).first
    unless user.nil?
      render json: { message: 'this facebook token is used' }, status: :bad_request
      return
    end

    begin
      facebook = Koala::Facebook::API.new(params[:facebook_token])
      fb_info = facebook.get_object('me?fields=id,name,photos,friends,picture.type(large)')
      @user = User.find_or_create_from_fb_info(fb_info)
    rescue Koala::Facebook::AuthenticationError
      message = { error: 1, message: 'facebook authentication error' }
      render json: message, status: :internal_server_error
      return
    end
    @user.facebook_token = params['facebook_token']
    @user.device_token = params['device_token']
    @user.save!
    @user.create_friendship(fb_info) unless fb_info['friends'].nil?
    render json: { message: 'success' }, status: :ok
  end

  def update
    params.permit(:university_id)
    @user.university_id = params[:university_id]
    @user.save!
  end
end
