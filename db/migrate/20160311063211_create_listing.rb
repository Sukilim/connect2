class CreateListing < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :area,  index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.string :rent_sale
      t.string :house_condo
      t.date :date_available
      t.string :unit_no
      t.string :price
      t.integer :sq_ft
      t.integer :no_of_rooms
      t.integer :no_of_baths
      t.integer :no_of_carpark
      t.string :pet_friendly
      t.text :additional_info
    end
  end
end
