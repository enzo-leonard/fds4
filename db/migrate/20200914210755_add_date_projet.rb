class AddDateProjet < ActiveRecord::Migration[6.0]
  def change
    change_column :projets, :date, :datetime
  end
end
