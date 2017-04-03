FactoryGirl.define do
  factory :transfer do
    tour
    name 'Carro'
    seat_type Transfer.seat_types[:particular]
  end
end
