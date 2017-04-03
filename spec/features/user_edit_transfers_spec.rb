require 'rails_helper'

feature 'User edit transfers' do
  before(:each) do
    login
  end

  scenario 'successfully' do
    transfer = create(:transfer)

    visit edit_admin_transfer_path(transfer)

    fill_in 'Nome', with: 'Van'

    click_on 'Atualizar Transporte'

    expect(page).to have_content 'Van'
  end

  scenario 'with empty field' do

    transfer = create(:transfer)

    visit edit_admin_transfer_path(transfer)

    fill_in 'Nome', with: ''

    click_on 'Atualizar Transporte'

    expect(page).to have_content 'Não foi possível atualizar o transporte'
  end
end
