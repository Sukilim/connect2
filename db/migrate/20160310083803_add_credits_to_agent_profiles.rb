class AddCreditsToAgentProfiles < ActiveRecord::Migration
  def change
    add_column :agent_profiles, :credits, :integer
  end
end
