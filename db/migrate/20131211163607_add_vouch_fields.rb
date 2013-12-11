class AddVouchFields < ActiveRecord::Migration
  def change
    change_table :references do |t| 
      t.integer :feedback_value
      t.boolean :jammed
      t.boolean :performed
      t.boolean :recorded
    end
  end
end