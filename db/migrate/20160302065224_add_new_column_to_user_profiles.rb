class AddNewColumnToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :pin_code, :string
  end
end
