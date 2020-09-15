class AddDublon < ActiveRecord::Migration[6.0]
  def change
    add_column :projets, :double, :boolean
  end
end
