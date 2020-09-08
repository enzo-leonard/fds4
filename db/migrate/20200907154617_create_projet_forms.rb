class CreateProjetForms < ActiveRecord::Migration[6.0]
  def change
    create_table :projet_forms do |t|
      t.references :projet, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
