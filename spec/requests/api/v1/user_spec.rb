require 'rails_helper'

describe 'User' do
  let(:current_university) { create(:university) }
  let(:store) { create(:store, universities: [current_university]) }
  let(:current_user) { create(:user, university: current_university) }
  let(:matched_user) { create(:user, university: current_university) }
  let(:coupons) { (1..3).collect { create(:coupon) } }
  let(:header) { auth_header(current_user.access_token) }

  before do
    coupons.each do |coupon|
      coupon.store = store
      coupon.university = current_university
      coupon.save!
    end
  end

  describe 'status' do
    context 'without coupon' do
      it 'is root' do
        get '/api/v1/user', nil, header
        expect(response_json['status']).to eq 'root'
      end
    end

    context 'after get coupon' do
      param = { coupon_id: 1 }.to_json
      it 'is pre_matching' do
        post '/api/v1/coupon', param, header
        get '/api/v1/user', nil, header
        expect(response_json['status']).to eq 'pre_matching'
      end
    end
  end
end
