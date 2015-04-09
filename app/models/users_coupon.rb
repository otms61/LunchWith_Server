class UsersCoupon < ActiveRecord::Base
  enum status: [:active, :archived]
  belongs_to :user
  belongs_to :coupon
end
