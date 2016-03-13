class CreateAdminListing < ActiveRecord::Migration
  def change
    create_table :admin_listings do |t|
    	t.string :area
      t.string :location
      t.string :sq_ft
      t.string :avatar
    end
  end
end