require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  let(:user) { create(:user) }
  let(:categories) { create_list(:category, 3, user:) }

  before do
    sign_in user
  end

  describe 'GET /categories/:category_id/transactions/new' do
    it 'displays the new transaction form' do
      get new_category_transaction_path(categories.first)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end
end
