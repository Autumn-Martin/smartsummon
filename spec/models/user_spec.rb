require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe 'relationships' do
    it {should have_many(:favorite_champions)}
    it {should have_many(:champions)}
  end

  describe 'roles' do
    it 'can be created as an admin' do
      user = User.create(name: 'Hagrid', email: 'hagrid@hogwarts.com', password: 'dragon', role: 1)

      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end
    it 'can be created as a default user' do
      user = User.create(name: 'Hermione', email: 'hermione@hogwards.com', password: 'leviosa', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end
