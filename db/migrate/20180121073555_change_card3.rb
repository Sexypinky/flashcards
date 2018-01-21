class ChangeCard3 < ActiveRecord::Migration[5.1]
  def change
    change_table :cards do |t|
      t.remove :deck
    end
  end
end
