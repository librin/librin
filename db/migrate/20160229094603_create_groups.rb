class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :admin
      t.string :description

      t.timestamps null: false
    end
  end
end
