class ResourceController < ApplicationController
 before_action :authenticate_user!
 
  def profile
         @resource = Resource.new
  end
  
  # def loggedUser
       # @currentUser = User.find(current_user)
  # end
   
  def new
     @resource = Resource.new
  end
  
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
        tags.each {|tagS|
          newTag = Tag.find_or_initialize_by(:name =>tagS)
          @resource.tags<< newTag
        }
      end
        index
        render 'index'
    end
    
  end

  def search
        @search = params[:search]
        @resources = Resource.search(params[:search],
        field_weights: {title: 20, tags: 17, description: 10, author: 5},
        match_mode: :boolean,
     )
     puts @resources
     render 'index'
  end
#sacamos la búsqueda para que aparezcan 9 por página y en orden descendente de creación No lo he comprobado
  def index    
     @resources=Resource.all
  end
  
  def file
    id = params[:id]
   @resource = Resource.find id
   @currentUser = User.find(current_user)
   @documents = Document.find id
   @userSharing = @resource.user_id
   @tags = Tag.all
   puts @documents
  end
  
  def add_params
    params.require(:resource).permit(:title,:description,:author,:cover,:tags,:files=>[])
  end
end
