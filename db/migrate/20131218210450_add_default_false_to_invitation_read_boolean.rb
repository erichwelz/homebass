class AddDefaultFalseToInvitationReadBoolean < ActiveRecord::Migration
  def up
    change_column :invitations, :read, :boolean, :default => false
end

def down
    change_column :invitations, :read, :boolean, :default => nil
end
end
