require 'rails_helper'

feature 'User logins as Admin' do

  scenario 'successfully' do
    user = create(:user, email: "email@email.com", password: "epanenem")

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Log in'

    expect(page).to have_current_path(dashboard_path)
  end
end
