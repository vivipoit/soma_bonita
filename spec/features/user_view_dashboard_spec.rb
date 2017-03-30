require 'rails_helper'

feature 'Admin view dashboard' do
  before(:each) do
    user = create(:user, email: 'email@email.com', password: 'epanenem')
    sign_in user
  end

  scenario 'successfully' do
    visit dashboard_path

    expect(page).to have_content('Passeios')
    expect(page).to have_content('Categorias')

    expect(page).to have_content('Listar Passeios')
    expect(page).to have_content('Listar Categorias')

    expect(page).to have_content('Nova Categoria')
    expect(page).to have_content('Novo Passeio')
  end

  scenario 'and lists categories' do
    category = create(:category, name: 'Aventura')
    another_category = create(:category, name: 'Chora Menino')

    visit dashboard_path

    click_on 'Listar Categorias'

    expect(page).to have_content(category.name)
    expect(page).to have_content(another_category.name)
  end

  scenario 'and lists tours' do
    category = create(:category)
    tour = create(:tour, category: category)
    another_tour = create(:tour, name: 'Chora Menino', category: category)

    visit dashboard_path

    click_on 'Listar Passeios'

    expect(page).to have_current_path(admin_tours_path)
    expect(page).to have_content(tour.name)
    expect(page).to have_content(another_tour.name)
  end
end
