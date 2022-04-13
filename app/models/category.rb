class Category < ApplicationRecord
  has_many :food
  validates :name,presence: true
end
