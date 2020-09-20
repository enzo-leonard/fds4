class Projet < ApplicationRecord
    has_many :projet_target, dependent: :destroy
    has_many :projet_theme, dependent: :destroy
    has_many :projet_form, dependent: :destroy
    has_many :theme, through: :projet_theme
    has_many :target, through: :projet_target
    has_many :form, through: :projet_form
    has_one_attached :photo


    def show_target
        if self.target.count > 1
            data = 'a partir de' + self.target.first.name
        else
            data = '--'
            data = self.target.first.name if self.target.first
        end
        data
    end
end
