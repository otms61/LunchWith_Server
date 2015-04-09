require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  let(:current_university) { create(:university) }
  let(:store) { create(:store, universities: [current_university]) }
  let(:current_user) { create(:user, university: current_university) }
  let(:current_friend) { create(:user, name: 'Alice', university: current_university) }
  let(:current_coupon) { create(:coupon) }

  before do
    current_user.users_coupons.create!(coupon: current_coupon)
    current_friend.users_coupons.create!(coupon: current_coupon)
  end

  it 'has friend_ship' do
    expect(current_user.friend_ship).not_to be_nil
  end

  it 'has friends' do
    expect(current_user.friends).not_to be_nil
  end

  it 'has university' do
    expect(current_user.university).not_to be_nil
  end

  it 'has coupon' do
    expect(current_user.coupon).to eq current_coupon
  end

  context 'after matching' do
    before do
      current_friend.users_coupons.create!(coupon: current_coupon)
      Matching.create!(user1: current_user, user2: current_friend)
      @updated_user = User.find(current_user.id)
    end

    it 'has matching' do
      expect(@updated_user.matching).not_to be_nil
    end

    it 'has matched_user' do
      expect(@updated_user.matched_user).to eq current_friend
    end

    it 'has messages' do
      expect(@updated_user.messages).not_to be_nil
    end
  end
end
