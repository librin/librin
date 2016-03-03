class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :views
      t.float :average
      
      t.belongs_to :user, index:true
      t.belongs_to :group, index:true
      t.timestamps null: false
    end
  end
end
