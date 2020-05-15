class Expense < ApplicationRecord
  validates :expense_name, :expense_amount, :expense_date, presence: true
  belongs_to :user
  def self.search(start_search,end_search)
    Expense.where("expense_date >= :start_date AND expense_date <= :end_date",{start_date: start_search, end_date: end_search})
  end
end