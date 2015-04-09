require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryGirl.create(:store)
  end

  it 'has university' do
    expect(@store.universities).not_to be_nil
  end
end
