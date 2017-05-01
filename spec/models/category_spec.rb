require "rails_helper"

RSpec.describe Category, :type => :model do

  it 'must have name' do
    category = build(:category, name: '')
    expect(category).not_to be_valid
  end

  it 'name must be unique' do
    category = create(:category, name: 'Aventura')
    another_category = build(:category, name: 'Aventura')
    another_category.save
    expect(another_category).not_to be_valid
  end

end
