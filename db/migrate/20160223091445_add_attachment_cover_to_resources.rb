class AddAttachmentCoverToResources < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :resources, :cover
  end
end
