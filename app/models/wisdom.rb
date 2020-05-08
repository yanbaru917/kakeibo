class Wisdom < ApplicationRecord
  validates :word, presence: true

  def self.search(search)
    return Wisdom.all unless search
    Wisdom.where('word LIKE(?)', "%#{search}%")
  end
end
