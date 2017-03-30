require 'rails_helper'

feature 'visitor gets to the website' do

  scenario 'and finds the tours listed at the footer' do

    category = create(:category, name: 'Rapel')
    tours = create_list(:tour, 5, category: category)

    visit root_path

    within('footer') do

      expect(page).to have_content(tours.first.name)
      expect(page).to have_content(tours.first.attraction)
      expect(page).to have_content(tours.first.category.name)
      expect(page).to have_content(tours.first.site)

      expect(page).to have_content(tours.second.name)
      expect(page).to have_content(tours.second.attraction)
      expect(page).to have_content(tours.second.category.name)
      expect(page).to have_content(tours.second.site)

      expect(page).to have_content(tours.third.name)
      expect(page).to have_content(tours.third.attraction)
      expect(page).to have_content(tours.third.category.name)
      expect(page).to have_content(tours.third.site)

      expect(page).to have_content(tours.fourth.name)
      expect(page).to have_content(tours.fourth.attraction)
      expect(page).to have_content(tours.fourth.category.name)
      expect(page).to have_content(tours.fourth.site)

      expect(page).to have_content(tours.fifth.name)
      expect(page).to have_content(tours.fifth.attraction)
      expect(page).to have_content(tours.fifth.category.name)
      expect(page).to have_content(tours.fifth.site)

    end

  end

  scenario 'and clicks on a tour name in order to see details' do

    tour = create(:tour)

    visit root_path
    click_on tour.name

    expect(page).to have_content(tour.name)
    expect(page).to have_content(tour.attraction)
    expect(page).to have_content(tour.category.name)
    expect(page).to have_content(tour.duration)
    expect(page).to have_content(tour.distance)
    expect(page).to have_content(tour.description)

  end

  scenario 'and clicks on a site to see institucional information' do

    tour = create(:tour, site: 'http://riosucuri.com.br/')

    visit root_path
    click_on tour.site

    expect(current_url).to eq('http://riosucuri.com.br/')

  end

end
