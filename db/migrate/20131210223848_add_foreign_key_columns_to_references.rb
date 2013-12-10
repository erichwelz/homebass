class AddForeignKeyColumnsToReferences < ActiveRecord::Migration
  def change
  	change_table :references do |t| 
  		t.rename :user_id, :source_id
  		t.integer :target_id
  		t.index :source_id
  		t.index :target_id
  		t.index [:target_id, :source_id]
  	end
  end
end
