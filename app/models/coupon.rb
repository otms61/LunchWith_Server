class Coupon < ActiveRecord::Base
  enum status: [:active, :archived]
  belongs_to :store
  belongs_to :university
  has_many :matchings
  has_many :users_coupons
  has_many :users, through: :users_coupons

  def get_user_friends(user)
    users & user.friends
  end

  def do_matching
    shuffled_users = users.shuffle
    shuffled_users.each do |user|
      friend = get_user_friends(user).sample
      if friend
        matchings.create!(user1: user, user2: friend)
        friend.update_attributes(status: :arrange_time)
        shuffled_users.delete(friend)
      end
      user.update_attributes(status: :arrange_time)
    end
  end
end
