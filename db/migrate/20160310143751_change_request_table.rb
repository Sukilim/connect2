class ChangeRequestTable < ActiveRecord::Migration
  def change
    if column_exists?(:requests, :rent_sale)
      remove_column :requests, :rent_sale, :integer
      
      add_column :requests, :rent_sale, :string

    end
    if column_exists?(:requests, :house_condo)
      
      remove_column :requests, :house_condo, :integer
      
      add_column :requests, :house_condo, :string
    end
  end
end