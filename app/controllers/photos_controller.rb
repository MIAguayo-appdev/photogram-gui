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

  def delete

    the_id = params.fetch("toast_id")
    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.first

    the_photo.destroy
    #this method issues command to destroy photo

    the_photo

    #render({ :template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def create
    #parameters: "query_image" => "https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/north-america/chicago-booth-uchicago-campus.jpg?cx=0.59&cy=0.56&cw=940&ch=749&hash=399733267B8702EE5E9A5C00DC831BDD", "query_caption" => "Chicago Booth", "query_owner_id" => "117"
    
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")
    
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save
    
    
    #render({ :template => "photo_templates/create.html.erb"})
    #redirect_to("/photos/" + a_new_photo.id.to_s)

    next_url = "/photos/" + a_new_photo.id.to_s
    redirect_to(next_url)
    
  end

  def update
    #Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/north-america/chicago-booth-uchicago-campus.jpg?cx=0.59&cy=0.56&cw=940&ch=749&hash=399733267B8702EE5E9A5C00DC831BDD", "query_caption"=>"New Booth", "modify_id"=>"952"}

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.first

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    #render({ :template => "photo_templates/update.html.erb"})
    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url)

  end


  def new_comment
    #Parameters: {"path_id"=>"777"}
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")

    a_new_comment = Comment.new
    a_new_comment.photo_id = input_photo_id
    a_new_comment.body = input_body
    a_new_comment.author_id = input_author_id

    a_new_comment.save    
    
    #render({ :template => "photo_templates/create.html.erb"})
    #redirect_to("/photos/" + a_new_photo.id.to_s)

    next_url = "/photos/" + input_photo_id
    redirect_to(next_url)
    
  end

end
