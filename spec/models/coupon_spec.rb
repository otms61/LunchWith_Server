require 'rails_helper'

RSpec.describe Coupon, type: :model do
  let(:current_university) { create(:university) }
  let(:store) { create(:store, universities: [current_university]) }
  let(:current_user) { create(:user, university: current_university) }
  let(:current_friend) { create(:user, name: 'Alice', university: current_university) }
  let(:header) { auth_header(current_user.access_token) }
  let(:friend_header) { auth_header(current_friend.access_token) }
  let(:coupons) { (1..3).collect { create(:coupon) } }
  let(:current_coupon) { create(:coupon) }

  before do
    current_coupon.store = store
    current_coupon.university = current_university
    current_coupon.save!
  end

  it 'not null' do
    expect(current_coupon).not_to be_nil
    expect(current_coupon.users).not_to be_nil
  end
end
