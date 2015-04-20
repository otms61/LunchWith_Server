class Api::V1::CouponController < Api::V1::ApplicationController
  before_action :should_not_have_coupon, only: [:create], if: :coupon?
  before_action :should_have_coupon, only: [:destroy], unless: :coupon?

  def show
    @coupon = Coupon.find(params[:id])
    @friends = @coupon.get_user_friends @user
  end

  def create
    @coupon = Coupon.find(params[:coupon_id])
    @user_coupon = @user.users_coupons.build(coupon: @coupon)

    if @user_coupon.save
      @user.update_attributes(status: :pre_matching)
    else
      render json: { error: 1, message: :unprocessable_entity }, status: :bad_request
      return
    end
  end

  def destroy
    UsersCoupon.where(user_id: @user.id, coupon_id: params[:id]).each(&:destroy)

    @user.update_attributes status: :root
    render json: { success: 1 }, status: :ok
  end

  private

  def coupon?
    !@user.root?
  end

  def should_not_have_coupon
    render :have_other_coupon_error, status: :bad_request
  end

  def should_have_coupon
    message = { error: 1, message: "you don't have coupon" }
    render json: message, status: :bad_request
  end
end
