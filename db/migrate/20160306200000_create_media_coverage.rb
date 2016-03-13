class CreateMediaCoverage < ActiveRecord::Migration
  def change
    create_table :media_coverages do |t|
   		 t.string :avatar
    end
  end
end