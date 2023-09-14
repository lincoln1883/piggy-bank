require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  include Devise::Test::ControllerHelpers
  it 'displays the welcome message' do
    render

    expect(rendered).to have_selector('h1.text-center', text: 'Piggy Bank App')
  end
end
