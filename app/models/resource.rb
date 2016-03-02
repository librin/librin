class Resource < ActiveRecord::Base
  has_many :documents
  has_many :comments
  has_many :votes
  has_and_belongs_to_many :tags

  belongs_to :user
  has_one :group, through: :user
  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"

  validates_attachment :cover, content_type: { content_type: /\Aimage\/.*\Z/ }

  def get_votes
    if self.votes.empty?
      return "No ha sido votado todavía"
    else
      cont=0.0
      votes=0
      self.votes.each {|vote|
        votes=votes +vote.value
        cont+=1
      }
      votes=votes/cont
      votes.round(1)
    end
  end

  def editable(user)
    if self.user_id == user.id || self.group.admin == user.id
      true
    else
      false
    end
  end

  def votable(user)
   if self.votes.where(:user_id =>user.id).empty?
     true
   else
     false
   end
  end

  def addTags(tags)
  	tags=tags.upcase.split(",")
        tags.each_index{|x| tags[x]=tags[x].strip}
        tags.each {|tagS|
          newTag = Tag.find_or_initialize_by(:name =>tagS)
          self.tags<< newTag
        }
  end
end
