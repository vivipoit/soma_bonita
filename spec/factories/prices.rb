FactoryGirl.define do
  factory :price do
    tour
    start_date "2017-03-31"
    end_date "2017-04-05"
    adult_price 100
    child_price 50
    baby_price 5
    season_type Price.season_types[:high_season]
  end
end
