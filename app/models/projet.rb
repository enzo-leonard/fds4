class Projet < ApplicationRecord
  belongs_to :theme
  belongs_to :target
  belongs_to :form
end
