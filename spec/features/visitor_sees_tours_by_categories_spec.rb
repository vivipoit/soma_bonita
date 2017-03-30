require 'rails_helper'

  feature 'visitor sees tours by categories' do

    scenario 'successfully' do


      category = create(:category, name: 'Mergulho')
      tour1 = create(:tour, category: category, name: 'Flutuacao Rio Sucuri')
      tour2 = create(:tour, category: category, name: 'Cachoeira Boca da Onca')
      tour3 = create(:tour, category: category, name: 'Rapel Abismo Anhumas')

      visit root_path

      click_on('Mergulho', match: :first)

      expect(page).to have_content(tour1.name)
      expect(page).to have_content(tour2.name)
      expect(page).to have_content(tour3.name)

    end
    scenario 'visitor click on tour within category' do


      category = create(:category, name: 'Flutuaçāo')
      tour1 = create(:tour, category: category, name: 'Flutuacao Rio Sucuri')
      tour2 = create(:tour, category: category, name: 'Cachoeira Boca da Onca')
      tour3 = create(:tour, category: category, name: 'Rapel Abismo Anhumas')

      visit category_path(category)

      click_on('Rapel Abismo Anhumas', match: :first)

      expect(page).to have_css('h1', text: tour1.name)
    end
  end
