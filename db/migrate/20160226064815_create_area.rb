class CreateArea < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :area
    end
  end
end
