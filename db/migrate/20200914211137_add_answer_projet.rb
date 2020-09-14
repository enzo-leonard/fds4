class AddAnswerProjet < ActiveRecord::Migration[6.0]
  def change
    add_column :projets, :answer, :text
  end
end
