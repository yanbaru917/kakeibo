class Expense < ApplicationRecord
  def self.search(search)
    return Expense.all unless search
    Expense.where(expense_date: expense.in_time_zone.all_month)
  end
end
