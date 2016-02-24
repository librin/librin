class ResourceController < ApplicationController
 before_action :authenticate_user!
  
  def create
    @resource = Resource.new(add_params)
    if @resource.save   
      if params[:files]
        params[:files].each { |file|
          @resource.documents.create(file: file)
        }
      end
      if params[:tags]
        tags=params[:tags].split(",")
        tags.each_index{|x| tags[x]=tags[x].strip}
        tagsObjects = Tag.all
        tags.each {|tagS|
          newTag = Tag.find_or_initialize_by(:name =>tagS)
          puts "el tag es:"
          puts newTag
          @resource.tags<< newTag

        }
      end
    end
    

=begin        tag = tagsObjects.where(:name => tagS)
        puts "El tag es"
        puts tag
        
       if tag != nil then
          puts "Ha encontrado el tag"
          @resource.tags << tag
          @resource.save
       else
         puts "No ha encontrado el tag"
          tag = Tag.new
          tag.name = tagS
          puts tag
          @resource.tags << tag
          @resource.save 
=end

  end
  
  def new
    @resource = Resource.new
  end

  def search
        @resources = Resource.search(params[:search],
        field_weights: {title: 20, description: 10, author: 5},
        match_mode: :boolean
     )
     puts @resources
  end

  def delete
  end

  def index
     @documents=Document.all
     @resources=Resource.all

  end

  def update
  end
  
  def add_params
    params.require(:resource).permit(:title,:description,:author,:cover,:tags,:files=>[])
  end
end
