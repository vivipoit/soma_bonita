require 'rails_helper'

feature 'Admin creates tour' do
  scenario 'successfully' do
    user = login
    tour = build(:tour)

    visit dashboard_path
    click_on 'Novo Passeio'

    fill_in 'Nome', with: tour.name
    fill_in 'Descrição', with: tour.description
    select  tour.category.name, from: 'Categoria'
    fill_in 'Atrativo', with: tour.attraction
    fill_in 'Duração', with: tour.duration
    fill_in 'Distância', with: tour.distance
    fill_in 'Site', with: tour.site

    click_on 'Salvar Passeio'


    expect(page).to have_current_path(admin_tour_path(1))
    expect(page).to have_css('h1', text: tour.name)
    expect(page).to have_content tour.description
    expect(page).to have_content tour.category.name
    expect(page).to have_content tour.attraction
    expect(page).to have_content tour.duration
    expect(page).to have_content tour.distance
    expect(page).to have_content tour.site
  end

  scenario 'With invalid data' do
    user = login

    visit new_admin_tour_path

    click_on 'Salvar Passeio'

    expect(page).to have_content 'Passeio não pode ser cadastrado, verifique os dados'
  end
end
