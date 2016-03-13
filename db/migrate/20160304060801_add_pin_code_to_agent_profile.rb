class AddPinCodeToAgentProfile < ActiveRecord::Migration
  def change
    add_column :agent_profiles, :pin_code, :string
  end
end
