class CreateRequest < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :area_id
      t.integer :location_id
      t.integer :budget_min
      t.integer :budget_max
      t.integer :rent_sale
      t.integer :user_id
      t.string :pet_friendly
      t.string :sq_ft
      t.string :furnished
      t.integer :no_of_rooms
      t.integer :no_of_carpark
      t.integer :house_condo
      t.date :date_needed
      t.text :special_req
    end
  end
end
