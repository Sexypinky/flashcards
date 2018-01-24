class AddDeckToCards < ActiveRecord::Migration[5.1]
  def change
    change_table :cards do |t|
    t.string :deck, null: false, default: ""
    end
  end
end
