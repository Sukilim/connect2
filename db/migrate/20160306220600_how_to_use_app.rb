class HowToUseApp < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :title
      t.text :description
      t.string :avatar
    end
  end
end