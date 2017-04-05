require 'rails_helper'

feature 'User view transfers' do
  before(:each) do
    login
  end

  scenario 'successfully' do
    tour = create(:tour)
    private_transfer = create(:transfer, name: 'Carro', tour: tour)
    shared_transfer = create(:transfer, name: 'Van', tour: tour)
    another_transfer = create(:transfer, name: 'Ônibus', tour: tour)

    visit admin_transfers_path

    expect(page).to have_content private_transfer.name
    expect(page).to have_content shared_transfer.name
    expect(page).to have_content another_transfer.name
  end

  scenario 'view a friendly message' do
    visit admin_transfers_path

    expect(page).to have_content 'Nenhum Transporte Cadastrado'
  end

  scenario 'and edit a transfer' do
    transfer = create(:transfer)

    visit admin_transfers_path

    find(:xpat, "//a[@href='#{edit_admin_transfer_path(transfer)}']").click

    expect(page).to have_current_path(edit_admin_transfer_path(transfer))

    fill_in 'Nome', with: 'Táxi'

    click_on 'Atualizar Transporte'

    expect(page).to have_content 'Táxi'
  end

  scenario 'and deletes a transfer' do

    tour = create(:tour)
    transfer = create(:transfer, name: 'Carro', tour: tour)
    another_transfer = create(:transfer, name: 'Ônibus', tour: tour)
    transfers_count = Transfer.count
    visit admin_transfers_path

    find(:xpat, "//a[@href='#{admin_transfer_path(transfer)}']").click

    expect(Transfer.count).to eq(transfers_count - 1)

  end
end
