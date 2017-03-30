require 'rails_helper'

feature 'User view tours' do
  scenario 'successfully' do
    user = login
    tour = create(:tour)

    visit dashboard_path

    click_on "Listar Passeios"

    expect(page).to have_content(tour.name)
    expect(page).to have_content(tour.attraction)
    expect(page).to have_content(tour.category.name)
  end

  scenario 'and view tours ordered by name' do
    user = login

    category = create(:category)
    second_tour = create(:tour, name: "Caminhada", category: category)
    third_tour = create(:tour, name: "Raft", category: category)
    first_tour = create(:tour, name: "Aventura", category: category)

    visit dashboard_path

    click_on "Listar Passeios"

    within("#tours-table tbody tr:nth-child(1)") do
      expect(page).to have_content(first_tour.name)
    end

    within("#tours-table tbody tr:nth-child(2)") do
      expect(page).to have_content(second_tour.name)
    end

    within("#tours-table tbody tr:nth-child(3)") do
      expect(page).to have_content(third_tour.name)
    end
  end

  # scenario 'and views edit and delete actions on table' do
  #   user = login
  #
  #   category = create(:category)
  #   second_tour = create(:tour, name: "Caminhada", category: category)
  #   third_tour = create(:tour, name: "Raft", category: category)
  #   first_tour = create(:tour, name: "Aventura", category: category)
  #
  #   visit admin_tours_path
  #
  #   expect(page).to have_link(nil, href: edit_admin_tour_path(first_tour))
  #   expect(page).to have_xpath("//i[contains(@class, 'fa fa-times fa-fw')]/parent::a[@href='#{admin_tour_path(first_tour)}']")
  #
  #   expect(page).to have_link(nil, href: edit_admin_tour_path(second_tour))
  #   expect(page).to have_xpath("//i[contains(@class, 'fa fa-times fa-fw')]/parent::a[@href='#{admin_tour_path(second_tour)}']")
  #
  #   expect(page).to have_link(nil, href: edit_admin_tour_path(third_tour))
  #   expect(page).to have_xpath("//i[contains(@class, 'fa fa-times fa-fw')]/parent::a[@href='#{admin_tour_path(third_tour)}']")
  # end

  scenario 'and edits a tour' do
    user = login

    tour = create(:tour)

    visit admin_tours_path

    find(:xpath, "//a[@href='#{edit_admin_tour_path(tour)}']").click

    expect(page).to have_current_path(edit_admin_tour_path(tour))

    fill_in 'Nome', with: 'Chora Menino'

    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Chora Menino')
  end

  # scenario 'and deletes a tour', js: true do
  #   user = login
  #
  #   category = create(:category)
  #   tour = create(:tour, name: 'Chora Menino', category: category)
  #   another_tour = create(:tour, name: 'Epa Nenem', category: category)
  #
  #   visit admin_tours_path
  #
  #   accept_confirm do
  #     find(:xpath, "//i[contains(@class, 'fa fa-times fa-fw')]/parent::a[@href='#{admin_tour_path(tour)}']").click
  #   end
  #
  #   expect(page).not_to have_content(tour.name)
  #   expect(page).not_to have_content(tour.attraction)
  #   expect(page).not_to have_content(tour.category.name)
  # end
end
