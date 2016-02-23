class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.belongs_to :resource, index:true
      t.timestamps null: false
    end
  end
end
