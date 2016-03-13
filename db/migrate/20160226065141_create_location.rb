class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location
      t.references :area, index: true, foreign_key: true
    end
  end
end
