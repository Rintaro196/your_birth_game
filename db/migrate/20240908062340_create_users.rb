class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name,     null: false
      t.date :birth_date, null: false

      t.timestamps
    end
  end
end