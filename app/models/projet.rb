class Projet < ApplicationRecord
    has_many :projet_target
    has_many :projet_theme
    has_many :projet_form

    scope :filter_by_theme, -> (theme) { where theme: status }
    scope :filter_by_location, -> (location_id) { where location_id: location_id }
    scope :filter_by_name, -> (name) { where("name like ?", "#{name}%")}
end
