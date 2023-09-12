require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'association ' do
    it 'has many transactions' do
      association = described_class.reflect_on_association(:transactions)
      expect(association.macro).to eq(:has_many)
    end
  end
  describe 'validation' do
    it 'validates the presence of name' do
      category = Category.create(name: 'test title', icon: 'image.png')
      expect(category.valid?).to be(true)
      expect(category.name).to eq('test title')
      expect(category.icon).to eq('image.png')
    end
  end
end
