class CreateProjetThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :projet_themes do |t|
      t.references :projet, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
