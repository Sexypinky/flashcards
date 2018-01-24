class AddTryToCard < ActiveRecord::Migration[5.1]
  def change
    change_table :cards do |t|
      t.integer :try, default: 0
    end
  end
end
