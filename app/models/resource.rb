class Resource < ActiveRecord::Base
  has_many :documents
  has_many :comments
  has_many :votes
  has_and_belongs_to_many :tags

  belongs_to :user
  has_one :group, through: :user
  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"

  validates_attachment :cover, content_type: { content_type: /\Aimage\/.*\Z/ }
  validates_presence_of :title, message: 'Es necesario incluir un título'


  def setAverage
      cont=0.0
      average=0
      self.votes.each {|vote|
        average=average +vote.value
        cont+=1
      }
      average=average/cont
      average.round(1)
      self.average= average
      self.save
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
  	tags=tags.upcase.strip.split(",")
  	tags.reject(&:empty?)
        tags.each_index{|x| tags[x]=tags[x].strip}
        tags.each {|tagS|
          newTag = Tag.find_or_initialize_by(:name =>tagS)
          self.tags<< newTag
        }
  end
end
