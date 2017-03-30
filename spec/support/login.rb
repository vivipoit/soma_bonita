def login
    user = create(:user, email: 'email@email.com', password: 'epanenem')
    sign_in user
    user
end
