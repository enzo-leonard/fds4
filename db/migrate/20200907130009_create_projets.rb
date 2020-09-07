class CreateProjets < ActiveRecord::Migration[6.0]
  def change
    create_table :projets do |t|
      t.string :name_structure
      t.string :title
      t.string :url
      t.string :keywords
      t.string :difficulty
      t.date :date
      t.boolean :live
      t.text :synopsis
      t.string :image
      t.string :territory
      t.string :duration
      t.boolean :stars
      t.text :stars_text
      t.references :theme, null: false, foreign_key: true
      t.references :target, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
