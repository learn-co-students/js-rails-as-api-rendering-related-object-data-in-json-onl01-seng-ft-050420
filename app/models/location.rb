class Location < ApplicationRecord
    has_many :sightings
    has_many :birds, through: :sightings, source: :sightings_table_foreign_key_to_birds_table
end
