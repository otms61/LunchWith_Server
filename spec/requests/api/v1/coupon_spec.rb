require 'rails_helper'

describe 'Coupon' do
  let(:current_university) { create(:university) }
  let(:store) { create(:store, universities: [current_university]) }
  let(:current_user) { create(:user, university: current_university) }
  let(:current_friend) { create(:user, name: 'Alice', university: current_university) }
  let(:header) { auth_header(current_user.access_token) }
  let(:friend_header) { auth_header(current_friend.access_token) }
  let(:coupons) { (1..3).collect { create(:coupon) } }

  before do
    Matching.create!(user1: current_user, user2: current_friend)

    coupons.each do |coupon|
      coupon.store = store
      coupon.university = current_university
      coupon.save!
    end
  end

  describe 'get /api/v1/coupon/:id' do
    it 'should have coupon info' do
      get '/api/v1/coupon/1', nil, header
      expect(response_json).to have_key('contents')
    end
  end

  describe 'post /api/v1/coupon' do
    param = { coupon_id: 1 }.to_json
    before do
      post '/api/v1/coupon', param, header
    end

    it 'should return coupon info' do
      expect(response_json['success']).to eq 1
    end

    it 'should change user status' do
      updated_user = User.find(current_user.id)
      expect(updated_user.status).to eq 'pre_matching'
    end

    context 'with coupon' do
      it 'should return badrequest ' do
        post '/api/v1/coupon', param, header
        expect(response_json['error']).to eq 1
        expect(response.status).to eq 400
      end
    end
  end

  describe 'delete /api/v1/coupon/:id' do
    param = { coupon_id: 1 }.to_json

    it 'should return coupon info' do
      post '/api/v1/coupon', param, header
      coupon_id = response_json['coupon']['id']
      delete "/api/v1/coupon/#{coupon_id}", nil, header
      expect(response_json['success']).to eq 1
    end

    it 'should change user status' do
      post '/api/v1/coupon', param, header
      delete '/api/v1/coupon/1', nil, header
      updated_user = User.find(current_user.id)
      expect(updated_user.status).to eq 'root'
    end

    context 'without coupon' do
      it 'should return badrequest ' do
        delete '/api/v1/coupon/1', nil, header
        expect(response_json['error']).to eq 1
        expect(response.status).to eq 400
      end
    end
  end
end
