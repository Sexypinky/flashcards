class AddSm2ToCards < ActiveRecord::Migration[5.1]
  def change
    change_table :cards do |t|
      t.decimal :easiness_factor, precision: 2, scale: 1, default: 2.5, null: false
      t.integer :number_repetitions, default: 0, null: false
      t.integer :quality_of_last_recall
      t.date :next_repetition
      t.integer :repetition_interval
      t.date :last_studied
    end
  end
end
