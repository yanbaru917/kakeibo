class RemoveIncomeValueIdFromIncomes < ActiveRecord::Migration[5.2]
  def change
    remove_column :incomes, :Income_value_id, :integer
  end
end
