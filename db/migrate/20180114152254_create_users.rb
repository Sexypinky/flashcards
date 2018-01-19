class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.remove :email,:password
      t.remove :created_at, :updated_at
    end
  end
end
