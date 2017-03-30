require 'rails_helper'

feature 'visitor clicks on tour name on footer' do

  scenario 'and sees current and future prices' do

    tour = create(:tour, name: "Meu Passeio")

    price_past = create(:price, tour: tour,
                    start_date: '2017-05-01',
                    end_date: '2017-05-30',
                    adult_price: 150,
                    child_price: 75,
                    baby_price: 15)

    price_current = create(:price, tour: tour,
                      start_date: '2017-06-01',
                      end_date: '2017-06-30',
                      adult_price: 189,
                      child_price: 81,
                      baby_price: 18)

    price_future = create(:price, tour: tour,
                      start_date: '2017-07-01',
                      end_date: '2017-07-30',
                      adult_price: 196,
                      child_price: 33,
                      baby_price: 17)

    Timecop.travel('2017-06-15')

    visit root_path
    click_on "Meu Passeio"

    expect(page).to have_content("Meu Passeio")

    within('table#tour_prices') do

      expect(page).not_to have_content('01/05/2017')
      expect(page).not_to have_content('30/05/2017')
      expect(page).not_to have_content('R$ 150,00')
      expect(page).not_to have_content('R$ 75,00')
      expect(page).not_to have_content('R$ 15,00')

      expect(page).to have_content('01/06/2017')
      expect(page).to have_content('30/06/2017')
      expect(page).to have_content('R$ 189,00')
      expect(page).to have_content('R$ 81,00')
      expect(page).to have_content('R$ 18,00')

      expect(page).to have_content('01/07/2017')
      expect(page).to have_content('30/07/2017')
      expect(page).to have_content('R$ 196,00')
      expect(page).to have_content('R$ 33,00')
      expect(page).to have_content('R$ 17,00')

    end

  end

end
