class Projet < ApplicationRecord
    has_many :projet_target
    has_many :projet_theme
    has_many :projet_form
    has_many :theme, through: :projet_theme
    has_many :target, through: :projet_target
    has_many :form, through: :projet_form


    def show_target
        if self.target.count > 1
            data = 'a partir de' + self.target.first.name
        else
            data = self.target.first.name
        end
        data
    end
end
