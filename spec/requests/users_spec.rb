require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "access signup path" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /login" do
    it "access login path" do
      get login_path
      expect(response).to have_http_status(200)
    end
  end
end