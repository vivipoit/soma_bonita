require 'rails_helper'

feature 'visitor sees prices witih period' do

  scenario 'successfully' do

    category = create(:category)
    tour1 = create(:tour, category: category, name: 'Flutuacao Rio Sucuri')
    tour2 = create(:tour, category: category, name: 'Cachoeira Boca da Onca')
    tour3 = create(:tour, category: category, name: 'Rapel Abismo Anhumas')

    high_season_price_tour1 = create(:price, tour: tour1,
                                        start_date: '2017-02-01',
                                        end_date: '2017-03-01',
                                        adult_price: 120,
                                        child_price: 99,
                                        baby_price: 13,
                                        season_type: 1)
    low_season_price_tour1 = create(:price, tour: tour1,
                                        start_date: '2017-02-01',
                                        end_date: '2017-03-01',
                                        adult_price: 90,
                                        child_price: 59,
                                        baby_price: 0,
                                        season_type: 0)

    high_season_price_tour2 = create(:price, tour: tour2,
                                        start_date: '2017-02-01',
                                        end_date: '2017-03-01',
                                        adult_price: 110,
                                        child_price: 79,
                                        baby_price: 25,
                                        season_type: 1)
    low_season_price_tour2 = create(:price, tour: tour2,
                                        start_date: '2017-02-01',
                                        end_date: '2017-03-01',
                                        adult_price: 60,
                                        child_price: 33,
                                        baby_price: 11,
                                        season_type: 0)

    high_season_price_tour3 = create(:price, tour: tour3,
                                        start_date: '2017-02-01',
                                        end_date: '2017-03-01',
                                        adult_price: 898,
                                        child_price: 630,
                                        baby_price: 420,
                                        season_type: 1)
    low_season_price_tour3 = create(:price, tour: tour3,
                                        start_date: '2017-02-01',
                                        end_date: '2017-03-01',
                                        adult_price: 700,
                                        child_price: 412,
                                        baby_price: 134,
                                        season_type: 0)

    high_season = create(:high_season, name: 'Carnaval', start_date: '2017-02-10', end_date: '2017-02-18')

    visit root_path

    within('div#prices_within_period') do

      fill_in 'Desde:', with: '2017-02-09'
      fill_in 'Até:',   with: '2017-02-10'

      click_on 'Ver Preços'

    end

    expect(page).to have_css('h2', text: 'Preços para o período entre 09/02/2017 e 10/02/2017')

    within('table#prices_within_period') do

      expect(page).to have_content('Nome do Passeio')
      expect(page).to have_content('Flutuacao Rio Sucuri')
      expect(page).to have_content('Cachoeira Boca da Onca')
      expect(page).to have_content('Rapel Abismo Anhumas')

      expect(page).to have_content('09/02/2017')
      expect(page).to have_content('Baixa')
      expect(page).to have_content('R$ 90,00')
      expect(page).to have_content('R$ 60,00')
      expect(page).to have_content('R$ 700,00')

      expect(page).to have_content('10/02/2017')
      expect(page).to have_content('ALTA')
      expect(page).to have_content('R$ 120,00')
      expect(page).to have_content('R$ 110,00')
      expect(page).to have_content('R$ 898,00')

    end

  end #scenario anterior

  scenario 'Without date' do

    category = create(:category)
    tour1 = create(:tour, category: category, name: 'Flutuacao Rio Sucuri')
    tour2 = create(:tour, category: category, name: 'Cachoeira Boca da Onca')

    high_season_price_tour1 = create(:price, tour: tour1,
                                        start_date: Date.today,
                                        end_date: Date.today,
                                        adult_price: 120,
                                        child_price: 99,
                                        baby_price: 13,
                                        season_type: 1)

    high_season_price_tour2 = create(:price, tour: tour2,
                                        start_date: Date.today + 2.weeks,
                                        end_date: Date.today + 1.month,
                                        adult_price: 110,
                                        child_price: 79,
                                        baby_price: 25,
                                        season_type: 1)



    high_season = create(:high_season, name: 'Carnaval', start_date: Date.today, end_date: Date.today + 1.month)

    visit root_path

    within('div#prices_within_period') do

      fill_in 'Desde:', with: ''
      fill_in 'Até:',   with: ''

      click_on 'Ver Preços'

    end

    expect(page).to have_css('h2', text: "Preços para o período entre #{I18n.l(Date.today)} e #{I18n.l(Date.today)}")

    within('table#prices_within_period') do

      expect(page).to have_content('Nome do Passeio')
      expect(page).to have_content('Flutuacao Rio Sucuri')

      expect(page).to have_content( I18n.l(Date.today))
      expect(page).to have_content('ALTA')
      expect(page).to have_content('R$ 120,00')
      expect(page).to have_content('R$ 99,00')
      expect(page).to have_content('R$ 13,00')

      expect(page).not_to have_content('Cachoeira Boca da Onca')
      expect(page).not_to have_content('R$ 110,00')
      expect(page).not_to have_content('R$ 79,00')
      expect(page).not_to have_content('R$ 25,00')
    end

  end

scenario 'and with only tour of interest' do

  category = create(:category)
  tour1 = create(:tour, category: category, name: 'Flutuacao Rio Sucuri')
  tour2 = create(:tour, category: category, name: 'Cachoeira Boca da Onca')
  tour3 = create(:tour, category: category, name: 'Rapel Abismo Anhumas')

  high_season_price_tour1 = create(:price, tour: tour1,
                                      start_date: '2017-02-01',
                                      end_date: '2017-03-01',
                                      adult_price: 120,
                                      child_price: 99,
                                      baby_price: 13,
                                      season_type: 1)
  low_season_price_tour1 = create(:price, tour: tour1,
                                      start_date: '2017-02-01',
                                      end_date: '2017-03-01',
                                      adult_price: 90,
                                      child_price: 59,
                                      baby_price: 0,
                                      season_type: 0)

  high_season_price_tour2 = create(:price, tour: tour2,
                                      start_date: '2017-02-01',
                                      end_date: '2017-03-01',
                                      adult_price: 110,
                                      child_price: 79,
                                      baby_price: 25,
                                      season_type: 1)
  low_season_price_tour2 = create(:price, tour: tour2,
                                      start_date: '2017-02-01',
                                      end_date: '2017-03-01',
                                      adult_price: 60,
                                      child_price: 33,
                                      baby_price: 11,
                                      season_type: 0)

  high_season_price_tour3 = create(:price, tour: tour3,
                                      start_date: '2017-02-01',
                                      end_date: '2017-03-01',
                                      adult_price: 898,
                                      child_price: 630,
                                      baby_price: 420,
                                      season_type: 1)
  low_season_price_tour3 = create(:price, tour: tour3,
                                      start_date: '2017-02-01',
                                      end_date: '2017-03-01',
                                      adult_price: 700,
                                      child_price: 412,
                                      baby_price: 134,
                                      season_type: 0)

  high_season = create(:high_season, name: 'Carnaval', start_date: '2017-02-10', end_date: '2017-02-18')

  visit root_path

  within('div#prices_within_period') do

    fill_in 'Desde:', with: '2017-02-09'
    fill_in 'Até:',   with: '2017-02-10'
    check tour1.name
    check tour2.name

    click_on 'Ver Preços'

  end

  expect(page).to have_css('h2', text: 'Preços para o período entre 09/02/2017 e 10/02/2017')

  within('table#prices_within_period') do

    expect(page).to have_content('Nome do Passeio')
    expect(page).to have_content('Flutuacao Rio Sucuri')
    expect(page).to have_content('Cachoeira Boca da Onca')
    expect(page).not_to have_content('Rapel Abismo Anhumas')

    expect(page).to have_content('09/02/2017')
    expect(page).to have_content('Baixa')
    expect(page).to have_content('R$ 90,00')
    expect(page).to have_content('R$ 60,00')
    expect(page).not_to have_content('R$ 700,00')

    expect(page).to have_content('10/02/2017')
    expect(page).to have_content('ALTA')
    expect(page).to have_content('R$ 120,00')
    expect(page).to have_content('R$ 110,00')
    expect(page).not_to have_content('R$ 898,00')
    end
  end
end
