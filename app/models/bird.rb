class Bird < ApplicationRecord
    has_many :signtings
    has_many :locations, through: :signtings
end