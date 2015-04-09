require 'rails_helper'

describe 'University' do
  let(:current_universities) { (1..3).collect { create(:university) } }
  let(:current_user) { create(:user, university: current_universities.sample) }
  let(:header) { auth_header(current_user.access_token) }

  describe 'index' do
    it 'should have university list' do
      get '/api/v1/university', nil, header
      expect(response_json.length).to eq 3
    end
  end
end
