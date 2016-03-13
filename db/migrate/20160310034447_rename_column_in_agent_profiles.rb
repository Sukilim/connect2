class RenameColumnInAgentProfiles < ActiveRecord::Migration
  def change
  	rename_column :agent_profiles, :company_address, :company_reg_no
  end
end
