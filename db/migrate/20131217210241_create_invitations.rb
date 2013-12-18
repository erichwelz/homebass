class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :sender_id
      t.integer :recepient_id
      t.text :content
      t.string :subject

      t.timestamps
    end
  end
end
