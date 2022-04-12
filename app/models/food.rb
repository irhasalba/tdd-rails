class Food < ApplicationRecord
    validates :name,presence: true, uniqueness: true
    validates :price,presence:true, numericality: {only_float: true, :greater_than => 0.01 }
    validates :category,presence: true

    def self.by_letter(letter)
        where("name LIKE ?","#{letter}%").order(:name)
    end
end
