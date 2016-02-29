class ResourceController < ApplicationController
 before_action :authenticate_user!
 
  def profile
         @resource = Resource.new
         @tags = Tag.all
         @tags= @tags.each_index {|x| 
           @tags[x]=@tags[x].name
         }
  end
   
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
     render 'index'
  end

   def index    
     @resources = Resource.paginate(:page => params[:page], :per_page => 8)
   end

  
  def file
   id = params[:id]
   @resource = Resource.find id
   @currentUser = User.find(current_user)
   @userSharing = @resource.user_id
  end

  
  def download
    document = Document.find params[:id].to_i
    send_file document.file.path
  end
    
  def delete
    @delete = true
    id = params[:id]
    @resource = Resource.find id
    @title = @resource.title
    Resource.delete id
    index
    render :index
  end
 
  
  def show_update
    @resource = Resource.find(params[:id])
    tags = @resource.tags
    @listTags = []
    tags.each_index{|x|
                @listTags[x] = tags[x].name} 
    #@document = Resource.Document.file.url
    puts tags
  end
  
  def update
     @resource = Resource.find(params[:id])
     @resource.update_attributes(add_params)
     if @resource.save
       if params[:tags]
          tags=params[:tags].split(",")
          tags.each_index{|x| tags[x]=tags[x].strip}
          tags.each {|tagS|
            newTag = Tag.find_or_initialize_by(:name =>tagS)
            @resource.tags<< newTag
          }
       end
     end
    render 'file'
  end
  
  def add_params
    params.require(:resource).permit(:title,:description,:author,:cover,:tags,:files=>[])
  end

end
