class ResourceController < ApplicationController
 before_action :authenticate_user!
  
  def create
    @resource = current_user.resources.new(add_params)
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

  def index
     @documents=Document.all
     @resources=Resource.all
  end
  
  def file
    id = params[:id]
   @resource = Resource.find id
   @resources = Resource.all
   @documents = Document.all
   @tags = Tag.all
  end
  
  def add_params
    params.require(:resource).permit(:title,:description,:author,:cover,:tags,:files=>[])
  end
end
