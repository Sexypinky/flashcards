class ChangeUserActualdeck < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :actual_deck
      t.integer :actual_deck
    end
  end
end
