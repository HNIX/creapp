FactoryGirl.define do
  factory :asset do
    client nil
name "MyString"
description "MyText"
size 1
land_size 1
price 1.5
price_psf 1.5
hide_price false
cap_rate 1.5
occupancy 1.5
highlights "MyText"
year_built "MyString"
  end

end
