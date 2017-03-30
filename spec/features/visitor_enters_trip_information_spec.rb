require 'rails_helper'

feature 'visitor enters trip information' do
  scenario 'successfully' do

    budget = create(:budget)

    visit new_budget_path

    fill_in 'Início da Viagem',         with: budget.start_date
    fill_in 'Fim da Viagem',            with: budget.end_date
    fill_in 'Nome do Passeio',          with: budget.tour_name
    fill_in 'Quantidade de Adultos',    with: budget.quantity_adults
    fill_in 'Quantidade de Crianças',   with: budget.quantity_children
    fill_in 'Quantidade de Bebês',      with: budget.quantity_babies

    click_on 'Exibir Orçamento'

    expect(page).to have_content(budget.start_date)
    expect(page).to have_content(budget.end_date)
    expect(page).to have_content(budget.tour_name)
    expect(page).to have_content(budget.quantity_adults)
    expect(page).to have_content(budget.quantity_children)
    expect(page).to have_content(budget.quantity_babies)

  end
  scenario 'valid field in blank' do


    visit new_budget_path

    click_on 'Exibir Orçamento'

    expect(page).to have_content("Preencha os Campos Obrigatorios")
  end
end
