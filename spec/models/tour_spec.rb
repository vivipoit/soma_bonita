require 'rails_helper'

RSpec.describe Tour, :type => :model do
  describe 'minimum_age' do
    it 'correctly' do
      tour = build(:tour, minimum_age: 12)
      expect(tour).to be_valid
    end

    it 'bigger then 18' do
      tour = build(:tour, minimum_age: 19)
      expect(tour).not_to be_valid
      expect(tour.errors[:minimum_age]).to include('A Idade Mínima tem que estar entre 0 e 18')
    end

    it 'less then' do
      tour = build(:tour, minimum_age: -1)
      expect(tour).not_to be_valid
      expect(tour.errors[:minimum_age]).to include('A Idade Mínima tem que estar entre 0 e 18')
    end
  end
end
