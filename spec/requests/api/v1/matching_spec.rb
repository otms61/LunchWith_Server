require 'rails_helper'
require 'pry'

describe 'Matching' do
  let(:current_university) { create(:university) }
  let(:current_user) { create(:user, university: current_university, status: User.statuses[:arrange_time]) }
  let(:current_friend) { create(:user, name: 'Alice', university: current_university, status: User.statuses[:arrange_time]) }
  let(:bad_request_user) { create(:user, university: current_university, status: User.statuses[:root]) }
  let(:header) { auth_header(current_user.access_token) }
  let(:friend_header) { auth_header(current_friend.access_token) }
  let(:bad_request_header) { auth_header(bad_request_user.access_token) }

  before do
    Matching.create!(user1: current_user, user2: current_friend)
  end

  describe 'post /api/v1/matching' do
    before do
      param = {
        times: [
          { from: '1423825200', to: '1423825200' },
          { from: '1423826210', to: '1423826220' }
        ] }.to_json
      post '/api/v1/matching', param, header
    end

    it 'should success' do
      expect(response_json['success']).to eq 1
    end

    it 'should change user status' do
      updated_user = User.find(current_user.id)
      expect(updated_user.status).to eq 'post_arrange_time'
    end

    context 'by frined post' do
      before do
        param = {
          times: [
            { from: '1423825200', to: '1423825200' },
            { from: '1423826210', to: '1423826220' }
          ] }.to_json
        post '/api/v1/matching', param, header
        post '/api/v1/matching', param, friend_header
      end

      it 'should success' do
        expect(response_json['success']).to eq 1
      end

      it 'should change user status' do
        updated_user = User.find(current_user.id)
        expect(updated_user.status).to eq 'post_matching'
      end
    end
  end

  describe 'post /api/v1/matching' do
    before do
      param = {
        times: [
          { from: '1423825200', to: '1423825200' },
          { from: '1423826210', to: '1423826220' }
        ] }.to_json
      post '/api/v1/matching', param, bad_request_header
    end

    it 'should fail' do
      expect(response_json['error']).to eq 1
      expect(response.status).to eq 400
    end
  end
end
