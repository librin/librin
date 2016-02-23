ThinkingSphinx::Index.define :resource, :with => :active_record do
# fields
    indexes title, :sortable => true
    indexes author
    indexes description, :sortable => true
        
# attributes
   # has author_id, created_at, updated_at
end