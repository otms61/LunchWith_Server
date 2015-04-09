require 'rails_helper'
require 'rake'

describe 'Coupon task' do
  let(:current_university) { create(:university) }
  let(:current_user) { create(:user, university: current_university) }
  let(:current_friend) { create(:user, university: current_university) }
  let(:current_coupon) { create(:coupon) }

  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'coupon'
    Rake::Task.define_task(:environment)
  end

  before do
    @rake[task].reenable
    current_user.users_coupons.create!(coupon: current_coupon)
    current_friend.users_coupons.create!(coupon: current_coupon)
    current_user.friends << current_friend
    current_friend.friends << current_user
  end

  describe 'do_matching' do
    let(:task) { 'coupon:do_matching' }
    it 'should create matching.' do
      @rake[task].invoke(1)
      expect(current_user.matched_user).to eq current_friend
    end
  end
end
