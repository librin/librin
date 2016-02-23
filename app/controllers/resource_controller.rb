class ResourceController < ApplicationController
  
  def create
    @resource = Resource.new(add_params)
    if @resource.save   
      if params[:files]
        params[:files].each { |file|
          @resource.documents.create(file: file)
        }
      end
    end
    index
  render 'index'
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
    # @documents=Document.all
  end

  def update
  end
  
  def add_params
    params.require(:resource).permit(:title,:description,:author,:files=>[])
  end
end
