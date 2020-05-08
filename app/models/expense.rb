class Expense < ApplicationRecord
  validates :expense_name, :expense_amount, :expense_date, presence: true
  def self.search(search)
    return Expense.all unless search
    Expense.where(expense_date: expense.in_time_zone.all_month)
  end
end