class FixRecipientSpelling < ActiveRecord::Migration
  def change
  	remove_column :invitations, :recepient_id
  end
end
