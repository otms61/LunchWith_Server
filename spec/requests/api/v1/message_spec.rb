require 'rails_helper'

describe 'Message' do
  let(:current_university) { create(:university) }
  let(:current_user) { create(:user, university: current_university) }
  let(:current_friend) { create(:user, name: 'Alice', university: current_university) }
  let(:header) { auth_header(current_user.access_token) }
  let(:friend_header) { auth_header(current_friend.access_token) }

  before do
    Matching.create!(user1: current_user, user2: current_friend)

    @message = Message.new(message: 'hogehoge', user: current_user)
    @message.sequential_id = current_user.messages.length
    @message.matching_id = current_user.matching.id
    @message.save!
  end

  describe 'index' do
    param = { message: 'hi' }.to_json
    before do
      post '/api/v1/message', param, header
    end
    it 'should have message' do
      get '/api/v1/message', nil, header
      expect(response_json.length).to eq 2
    end

    describe 'last Bob\'s message' do
      context 'in Bob' do
        it 'should set is_me true' do
          get '/api/v1/message', nil, header
          expect(response_json.last['is_me']).to eq true
        end
      end
      context 'in Alice' do
        it 'should set is_me false' do
          get '/api/v1/message', nil, friend_header
          expect(response_json.last['is_me']).to eq false
        end
      end
    end
  end

  describe 'create' do
    param = { message: 'hi' }.to_json

    context 'by me' do
      it 'should create message' do
        post '/api/v1/message', param, header
        expect(response_json['name']).to eq 'Bob'
        expect(response_json['is_me']).to eq true
        expect(response_json['sequential_id']).to eq 1
        expect(response_json['message']).to eq 'hi'
      end
    end

    context 'by frined' do
      it 'should create message' do
        post '/api/v1/message', param, friend_header
        expect(response_json['name']).to eq 'Alice'
        expect(response_json['is_me']).to eq true
        expect(response_json['sequential_id']).to eq 1
        expect(response_json['message']).to eq 'hi'
      end
    end
  end
end
