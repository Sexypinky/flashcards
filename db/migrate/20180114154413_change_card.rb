class ChangeCard < ActiveRecord::Migration[5.1]
  def change
  change_table :cards do |t|
     t.integer :user_id
    end
  end
end
