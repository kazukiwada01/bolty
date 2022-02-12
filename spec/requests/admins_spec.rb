require 'rails_helper'

RSpec.describe 'Admins', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/admins/show'
      expect(response).to have_http_status(:success)
    end
  end
end
