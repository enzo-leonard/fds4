class CreateProjets < ActiveRecord::Migration[6.0]
  def change
    create_table :projets do |t|
      t.string :name_structure
      t.string :title
      t.string :url
      t.string :keywords
      t.integer :difficulty
      t.date :date
      t.boolean :live
      t.text :synopsis
      t.string :image
      t.integer :territory
      t.integer :duration
      t.boolean :stars
      t.text :stars_text

      t.timestamps
    end
  end
end
