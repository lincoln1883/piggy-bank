require 'rails_helper'

RSpec.describe 'transactions/index.html.erb', type: :view do
  include Devise::Test::ControllerHelpers
  let(:category) { create(:category, name: 'Test Category', icon: 'https://picsum.photos/200') }

  before(:each) do
    @category = category
    @transactions = [
      create(:transaction, name: 'Transaction 1', category:),
      create(:transaction, name: 'Transaction 2', category:)
    ]
    render
  end

  it 'displays category information' do
    expect(rendered).to have_selector('h2', text: 'Test Category')
  end

  it 'displays "Add a New Transaction" link for authorized users' do
    user = create(:user)
    sign_in user
    allow(view).to receive(:can?).and_return(true)
    render
    expect(rendered).to have_link('Add a new transaction',
                                  href: new_category_transaction_path(category_id: category.id))
  end
end
