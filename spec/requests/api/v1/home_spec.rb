require 'rails_helper'

describe 'Home' do
  let(:current_university) { create(:university) }
  let(:store) { create(:store, universities: [current_university]) }
  let(:current_user) { create(:user, university: current_university) }
  let(:coupons) { (1..3).collect { create(:coupon) } }

  before do
    coupons.each do |coupon|
      coupon.store = store
      coupon.university = current_university
      coupon.save!
    end
  end

  it 'homeにアクセスしたら情報がかえってくる' do
    get '/api/v1/home', nil, auth_header(current_user.access_token)
    expect(response_json).not_to eq nil
  end
end
