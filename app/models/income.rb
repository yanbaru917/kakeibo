class Income < ApplicationRecord
  validates :income_name, :income_date, presence: true
  validates :income_amount, numericality: true
  belongs_to :user

  def self.search(start_search,end_search)
    Income.where("income_date >= :start_date AND income_date <= :end_date",{start_date: start_search, end_date: end_search})
  end
end
