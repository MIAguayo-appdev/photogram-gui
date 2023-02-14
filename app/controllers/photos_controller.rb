class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    # Parameters: {"path_id => "###"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where ({ :id => url_id})

    @the_photo = matching_photos.first

    #if @the_user == nil
    #  redirect_to("/404")
    #else
      render({ :template => "photo_templates/show.html.erb"})
    #end
  end

end
