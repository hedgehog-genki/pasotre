require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'バリデーション' do
    it 'email と password どちらも値が設定されていれば OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'email' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end