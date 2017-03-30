require 'rails_helper'

feature 'user informs high season period' do
  before(:each) do
    user = create(:user, email: 'email@email.com', password: 'epanenem')
    sign_in user
  end

  scenario 'successfully' do
    high_season = create(:high_season)

    visit dashboard_path

    click_on "Nova Temporada"

    fill_in 'Nome',     with: high_season.name

    within('.high_season_start_date') do
      select high_season.start_date.day
      select 'Março'
      select '2017'
    end

    within('.high_season_end_date') do
      select high_season.end_date.day
      select 'Março'
      select '2017'
    end


    click_on 'Salvar'

    expect(page).to have_current_path(admin_high_seasons_path)
    expect(page).to have_content(high_season.name)
    expect(page).to have_content(I18n.l(high_season.start_date, format: :short))
    expect(page).to have_content(I18n.l(high_season.end_date, format: :short))
  end

  scenario 'with an end_date that is smaller than the start_date' do

    high_season = build(:high_season,name:'Feriado', start_date: '2016-01-05', end_date: '2015-01-05')

    visit new_admin_high_season_path

    fill_in 'Nome',     with: high_season.name

    within('.high_season_start_date') do
      select high_season.start_date.day
      select 'Janeiro'
      select '2016'
    end

    within('.high_season_end_date') do
      select high_season.end_date.day
      select 'Janeiro'
      select '2015'
    end

    click_on 'Salvar'

    expect(page).to have_content('Período inválido.')
    expect(page).to have_content('Não foi possível salvar a Alta Temporada')
    expect(page).to have_field('Nome', with: 'Feriado')
  end

  scenario 'without any information' do

    visit new_admin_high_season_path
    click_on 'Salvar'

    expect(page).to have_content('Não foi possível salvar a Alta Temporada')

  end

end
