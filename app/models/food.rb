class Food < ApplicationRecord
    # validates :name,presence: true, uniqueness: true 
    validates :name,presence: true, uniqueness: true
end
