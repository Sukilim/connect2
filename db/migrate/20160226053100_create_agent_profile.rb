class CreateAgentProfile < ActiveRecord::Migration
  def change
    create_table :agent_profiles do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :contact_no
      t.string :ren_id, :null => false
      t.string :company_name
      t.string :company_address
      t.text :about_me
      t.references :user, index: true, foreign_key: true
    end
  end
end
