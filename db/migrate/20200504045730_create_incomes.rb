class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :income_name, null: false
      t.integer :income_amount, null: false
      t.date :income_date, null: false
      t.timestamps
    end
  end
end
