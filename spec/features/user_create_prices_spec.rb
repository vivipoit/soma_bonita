require 'rails_helper'

feature 'Admin create prices' do
  before(:each) do
    user = login
  end
  scenario 'successfully' do
    price = build(:price)

    human_price = Price.human_attribute_name(price.season_type.to_sym)

    visit dashboard_path
    click_on 'Novo Preço'

    select price.tour.name, from: 'Passeio'
    within('.price_start_date') do
      select '31'
      select 'Março'
      select '2017'
    end

    within('.price_end_date') do
      select '5'
      select 'Abril'
      select '2017'
    end

    fill_in 'Preço por Adulto', with: price.adult_price
    fill_in 'Preço por Criança', with: price.child_price
    fill_in 'Preço por Bebê', with: price.baby_price
    choose human_price

    click_on 'Criar Preço'

    expect(page).to have_current_path(admin_price_path(1))
    expect(page).to have_content price.tour.name
    expect(page).to have_content I18n.l(price.start_date)
    expect(page).to have_content I18n.l(price.end_date)
    expect(page).to have_content price.adult_price
    expect(page).to have_content price.child_price
    expect(page).to have_content price.baby_price
    expect(page).to have_content human_price
  end

  scenario 'with invalid data' do
    visit new_admin_price_path

    click_on 'Criar Preço'

    expect(page).to have_content 'Não foi possível criar o preço'

  end

  scenario 'with invalid period' do
    price = build(:price, start_date: Date.today, end_date: Date.today - 1.day)

    human_price = Price.human_attribute_name(price.season_type.to_sym)

    visit new_admin_price_path

    select price.tour.name, from: 'Passeio'

    within('.price_start_date') do
      select price.start_date.day
      select 'Março'
      select '2017'
    end

    within('.price_end_date') do
      select price.end_date.day
      select 'Março'
      select '2017'
    end

    fill_in 'Preço por Adulto', with: price.adult_price
    fill_in 'Preço por Criança', with: price.child_price
    fill_in 'Preço por Bebê', with: price.baby_price
    choose human_price

    click_on 'Criar Preço'

    expect(page).to have_content 'Preço com Vigência Inválida'
  end
end
