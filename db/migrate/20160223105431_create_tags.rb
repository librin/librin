class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps null: false
    end
    #Table resources_tag created
    create_table :resources_tags, id: false do |t|
      t.belongs_to :resources, index: true
      t.belongs_to :tags, index: true
    end
  end
end
