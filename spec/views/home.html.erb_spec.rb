require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  it 'displays the welcome message' do
    render

    expect(rendered).to have_selector('h1.text-center', text: 'Welcome to the Piggy Bank App')
  end
end