require 'rails_helper'

feature 'Admin view prices' do
  scenario 'successfully' do
    login
    tour = create(:tour)
    price = create(:price, start_date: '2017-01-31', tour: tour)
    another_price = create(:price, start_date: '2017-02-02', tour: tour)

    visit dashboard_path

    click_on "Listar Preços"

    expect(page).to have_content("31/01/2017")
    expect(page).to have_content("02/02/2017")
  end
end
