require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it 'is valid with a name' do
    user = FactoryBot.build(:user, name: 'John Doe')
    expect(user).to be_valid
  end

  it 'is not an admin by default' do
    user = FactoryBot.build(:user)
    expect(user.admin?).to be_falsey
  end

  it 'can have an admin role' do
    user = FactoryBot.build(:user, role: 'admin')
    expect(user.admin?).to be_truthy
  end
end
