class ChangeCard2 < ActiveRecord::Migration[5.1]
  def change
    change_table :cards do |t|
      t.integer :deck_id
    end
  end
end
