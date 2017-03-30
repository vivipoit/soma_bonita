require 'rails_helper'

feature 'User edit price' do
  before(:each) do
    login
  end
  scenario 'successfully' do

    price = create(:price)
    new_baby_price = 0

    visit edit_admin_price_path(price)

    fill_in 'Preço por Bebê', with: new_baby_price

    click_on 'Atualizar Preço'

    expect(page).to have_current_path(admin_price_path(price))
    expect(page).to have_content new_baby_price

  end

  scenario 'with empty field' do

    price = create(:price)

    visit edit_admin_price_path(price)

    fill_in 'Preço por Bebê', with: ''

    click_on 'Atualizar Preço'

    expect(page).to have_content 'O preço não pode ser atualizado'

  end

  scenario ' with invalid period' do
    price = create(:price)

    visit edit_admin_price_path(price)

    within('.price_start_date') do
      select Date.today.day
      select 'Março'
      select '2017'
    end

    within('.price_end_date') do
      select -2.days.from_now.day
      select 'Março'
      select '2017'
    end

    click_on 'Atualizar Preço'

    expect(page).to have_content 'Preço com Vigência Inválida'

  end
end
