class UpdatingInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :sender_read, :boolean, default: true
    rename_column :invitations, :read, :recipient_read
  end
end
