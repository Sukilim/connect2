FactoryGirl.define do
  factory :request do
    area_id 1
    location_id 1
    budget_min 2000
    budget_max 2500
    pet_friendly "MyString"
    sq_ft "MyString"
    furnished "MyString"
    no_of_rooms 2
    no_of_carpark 2
    date_needed 24-3-2016
    special_req "MyString"
    rent_sale "MyString"
    house_condo "MyString"

    user nil
  end
end
