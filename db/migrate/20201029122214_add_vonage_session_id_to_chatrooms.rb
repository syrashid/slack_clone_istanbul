class AddVonageSessionIdToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :vonage_session_id, :string
  end
end
