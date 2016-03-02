class ResourceController < ApplicationController
 before_action :authenticate_user!
 
  def profile
    @tags = Tag.all
    @tags= @tags.each_index {|x|
      @tags[x]=@tags[x].name
    }
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
      	@resource.addTags(params[:tags])
      end
      redirect_to root_path
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
     @resources=current_user.group.resources.paginate(:page => params[:page], :per_page => 8)
  end

  def file
   id = params[:id]
   @resource = Resource.find id
  end

  def download
    document = Document.find params[:id].to_i
    send_file document.file.path
  end

  def delete
    id = params[:id]
    resource = Resource.find id
    if resource.editable(current_user)
      @title = resource.title
      Resource.delete id
      @delete = true
      index
      render :index
    else
      redirect_to :back
    end
  end

  def show_update
    @resource = Resource.find(params[:id])
    if @resource.editable(current_user)
      tags = @resource.tags
      @listTags = []
      tags.each_index{|x|
        @listTags[x] = tags[x].name
      }
    else
      redirect_to :back
    end
  end

  def update
     hashResources = params.require(:resource).permit(:id,:title,:description,:author,:files=>[])
     tags = params.require(:resource).permit(:tags)
     tags = tags[:tags]
     @resource = Resource.find(params[:id])
     hashResources[:tags] = []
     @resource.update_attributes(hashResources)
     @resource.addTags(tags)
     redirect_to root_path
  end

  def add_params
    params.require(:resource).permit(:title,:description,:author,:cover,:tags,:files=>[])
  end

  def update_params

  end
end






