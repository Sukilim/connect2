class ChangeSqFt < ActiveRecord::Migration
  def change
  	remove_column :requests, :sq_ft, :string
  	add_column :requests, :sq_ft, :integer
  end
end
