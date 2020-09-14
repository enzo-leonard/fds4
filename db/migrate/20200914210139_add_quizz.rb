class AddQuizz < ActiveRecord::Migration[6.0]
  def change
    add_column :projets, :question, :text
    add_column :projets, :good_answer, :string
    add_column :projets, :prop_1, :string
    add_column :projets, :prop_2, :string
    add_column :projets, :commentaire, :text
  end
end
