class Income < ApplicationRecord
  validates :income_name, :income_amount, :income_date, presence: true
  belongs_to :user
  def self.search(search)
    return Income.all unless search
    Income.where('income_date = ? ', "%#{search}%")
  end
end
