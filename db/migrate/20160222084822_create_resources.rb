class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :views
      

      t.timestamps null: false
    end
  end
end
