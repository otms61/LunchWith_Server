class User < ActiveRecord::Base
  attr_accessor :coupon
  attr_accessor :matching
  attr_accessor :matched_user
  attr_accessor :messages
  before_create :generate_access_token
  USER_STATE = [:root, :pre_matching, :arrange_time, :post_arrange_time, :post_matching, :matching_failed]
  enum status: USER_STATE

  belongs_to :university
  has_many :friend_ship
  has_many :friends, through: :friend_ship
  has_many :matching_times
  has_many :users_coupons

  # for Rails Admin
  def status_enum
    USER_STATE.each_with_index.to_a
  end

  def matching
    @matching ||= get_matching
  end

  def matched_user
    if matching.user1 == self
      @matched_user ||= matching.user2
    elsif matching.user2 == self
      @matched_user ||= matching.user1
    end
  end

  def messages
    @messages ||= matching.messages
  end

  def self.find_or_create_from_fb_info(fb_info)
    User.find_or_create_by(facebook_id: fb_info['id']) do |u|
      u.facebook_id = fb_info['id']
      u.name = fb_info['name']
      u.facebook_img = fb_info['picture']['data']['url']
    end
  end

  def create_friendship(fb_info)
    fb_info['friends']['data'].each do |friend|
      f = User.where(facebook_id: friend['id']).first
      if f
        friends << f unless friends.include? f
        f.friends << self unless f.friends.include? self
      end
    end
  end

  def save_matching_times(times)
    times.each do |time|
      from = Time.at(time[:from].to_i)
      to = Time.at(time[:to].to_i)
      matching_times.create!(matching_id: matching.id, from: from, to: to)
    end
  end

  def get_matching
    matching = Matching.find_by(user1_id: self.id)
    unless matching.nil?
      return matching
    else
      matching = Matching.find_by(user2_id: self.id)
      return matching
    end
  end

  def coupon
    users_coupons = self.users_coupons.select { |users_coupon| users_coupon[:status] == 0 }
    if users_coupons.length > 0
      @coupon ||= Coupon.find(users_coupons[0].coupon_id)
    end
  end

  def do_arrange_time
    matching_times.each do |time|
      matched_time = matched_user.matching_times.find do |t|
        t.from == time['from'] && t.to == time['to']
      end
      unless matched_time.nil?
        matching.update_attributes(from: matched_time.from, to: matched_time.to)
        update_attributes(status: :post_matching)
        matched_user.update_attributes(status: :post_matching)
        # @user.matched_user.push_notify('マッチングが成功しました！')
      end
    end
  end

  def push_notify(text)
    n = Rpush::Apns::Notification.new
    n.device_token = @user.matched_user.device_token
    unless n.device_token.nil?
      n.app = rpush.apns.app.find_by_name('lunchwith')
      n.alert = text
      n.save!
    end
  end

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
