class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :projects, :slug, unique: true
  end
end
