require 'rails_helper'

feature 'User view tours' do
  scenario 'successfully' do
    user = login
    high_season = create(:high_season)

    visit dashboard_path

    click_on "Listar Temporadas"

    expect(page).to have_content(high_season.name)
    expect(page).to have_content(I18n.l(high_season.start_date, format: :short))
    expect(page).to have_content(I18n.l(high_season.end_date, format: :short))
  end
end
