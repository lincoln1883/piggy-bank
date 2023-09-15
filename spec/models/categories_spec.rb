require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has a valid factory' do
    category = FactoryBot.build(:category)
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = FactoryBot.build(:category, name: nil)
    expect(category).to_not be_valid
  end

  it 'is invalid without an icon' do
    category = FactoryBot.build(:category, icon: nil)
    expect(category).to_not be_valid
  end

  it 'is valid with a name and icon' do
    category = FactoryBot.build(:category, name: 'Transport', icon: 'icon-url')
    expect(category).to be_valid
  end
end
