class ChangeC < ActiveRecord::Migration[5.1]
    def change
      change_table :cards do |t|
        t.remove :review_date
        t.date :review_date
    end
  end
end
