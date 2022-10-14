# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  let(:user) { FactoryBot.create(:user) }
  describe 'POST /login' do
    it 'returns http success' do
      post '/login', params: { username: user.username, password: user.password }
      expect(response).to have_http_status(:success)
    end
  end
end
