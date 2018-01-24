class AddActualDeckToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :actual_deck, null: false, default: ""
    end
  end
end
