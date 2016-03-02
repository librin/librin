ThinkingSphinx::Index.define :resource, :with => :active_record do
# fields
    indexes title, :sortable => true
    indexes author
    indexes description, :sortable => true
    indexes tags.name, :as => :tags




# attributes
    has tags.id, :as => :tag_ids
    has group.id, :as => :group_id
end
