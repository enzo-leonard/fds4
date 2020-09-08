class CreateProjetTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :projet_targets do |t|
      t.references :projet, null: false, foreign_key: true
      t.references :target, null: false, foreign_key: true

      t.timestamps
    end
  end
end
