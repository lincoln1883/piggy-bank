require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }
  before do
    allow(view).to receive(:current_user).and_return(user)
    assign(:categories, [create(:category, name: 'Category 1', icon: 'https://picsum.photos/200'),
                         create(:category, name: 'Category 2', icon: 'https://picsum.photos/200')])
    render
  end

  it 'displays a welcome message with the user name' do
    expect(rendered).to have_selector('h1.text-center', text: "Welcome, #{user.name}!")
  end

  it 'displays "Add a New Category" link' do
    expect(rendered).to have_link('Add a New Category', count: 1)
  end
end
