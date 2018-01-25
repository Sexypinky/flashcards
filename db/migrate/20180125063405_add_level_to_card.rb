class AddLevelToCard < ActiveRecord::Migration[5.1]
  def change
    change_table :cards do |t|
      t.integer :level, default: 0
      t.integer :try, default: 0
    end
  end
end
