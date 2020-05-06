class Income < ApplicationRecord
  def self.search(search)
    return Income.all unless search
    Income.where(income_date: income.in_time_zone.all_month)
  end
end
