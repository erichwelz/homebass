class RemoveSubjectFromInvitations < ActiveRecord::Migration
  def change
    remove_column :invitations, :subject
  end
end
