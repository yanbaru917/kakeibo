class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :expense_name, null: false
      t.integer :expense_amount, null: false
      t.timestamps
    end
  end
end
