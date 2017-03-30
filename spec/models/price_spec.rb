require 'rails_helper'

RSpec.describe Price, :type => :model do

  it 'should be valid' do
    tour = create(:tour)
    price = build(:price, tour: tour,
                          start_date: Date.today,
                          end_date: Date.tomorrow,
                          adult_price: 10,
                          child_price: 7,
                          baby_price: 5,
                          season_type: 0
                          )
    expect(price).to be_valid
  end

  it 'end date must be higher than start date' do
    tour = create(:tour)
    price = build(:price, tour: tour,
                          start_date: Date.today,
                          end_date: Date.today - 2.days)
    expect(price).not_to be_valid
  end

end
