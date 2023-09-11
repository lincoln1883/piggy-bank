require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'association ' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
    it 'has many categories' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end
  end
end

