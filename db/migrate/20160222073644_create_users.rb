class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :firstName
      t.string :lastName
      t.string :twitter
      t.string :linkedin
      t.string :github

      t.timestamps null: false
    end
  end
end
