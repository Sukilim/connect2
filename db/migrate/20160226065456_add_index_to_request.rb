class AddIndexToRequest < ActiveRecord::Migration
  def change
  	change_column :requests, :area_id, :integer, index: true
  	change_column :requests, :location_id, :integer, index: true
  	change_column :requests, :user_id, :integer, index: true
  end
end
