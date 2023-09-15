require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  before(:each) do
    assign(:category, Category.new)
  end

  it 'renders the form' do
    render
    expect(rendered).to have_selector('form') do |form|
      expect(form).to have_selector('label', text: 'Name')
      expect(form).to have_selector('input[type="text"]')

      expect(form).to have_selector('label', text: 'Icon')
      expect(form).to have_selector('input[type="text"]')

      expect(form).to have_selector('input[type="submit"][value="Save"]')
    end
  end

  it 'renders the form with the category object' do
    category = build(:category, name: 'Sample Category', icon: 'sample-icon-url')
    assign(:category, category)

    render

    expect(rendered).to have_selector('input#category_name[value="Sample Category"]')
    expect(rendered).to have_selector('input#category_icon[value="sample-icon-url"]')
  end
end
