require 'rails_helper'

feature 'User create transfers' do
  before(:each) do
    login
  end

  scenario 'successfully' do
    transfer = build(:transfer)
    human_transfer = Transfer.human_attribute_name(transfer.seat_type.to_sym)

    visit new_admin_transfer_path

    fill_in 'Nome', with: transfer.name
    choose human_transfer

    select transfer.tour.name, from: 'Passeio'

    click_on 'Criar Transporte'

    expect(page).to have_content transfer.name
    expect(page).to have_content transfer.tour.name
    expect(page).to have_content human_transfer
  end

  scenario 'with invalid data' do
    visit new_admin_transfer_path

    click_on 'Criar Transporte'

    expect(page).to have_content 'Não foi possível criar transporte.'
  end
end
