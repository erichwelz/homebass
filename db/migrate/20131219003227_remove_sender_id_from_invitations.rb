class RemoveSenderIdFromInvitations < ActiveRecord::Migration
  def change
    remove_column :invitations, :sender_id
  end
end
