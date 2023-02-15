class UsersController < ApplicationController

  def index
    
    matching_users = User.all 

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    # Parameters: {"path_username => "anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where ({ :username => url_username})

    @the_user = matching_usernames.first

    #if @the_user == nil
    #  redirect_to("/404")
    #else
      render({ :template => "user_templates/show.html.erb"})
    #end
  end

  def update
    #  Parameters: {"input_username"=>"Manisa", "path_id"=>"117"}
    url_id = params.fetch("path_id")

    matching_usernames = User.where ({ :id => url_id})

    new_username = matching_usernames.first
    new_username.username = :input_username

    next_url = "users/update_user/" + new_username.id.to_s
    redirect_to(next_url)
    #render({ :template => "user_templates/show.html.erb"})

  end

       
   def update
   #   Parameters: {"input_username"=>"hellonew", "path_username"=>"insert_user_record"}   
  
   new_username = params.fetch("input_username")
   username_id = params.fetch("path_id")

   matching_usernames = User.where({ :id => username_id})
   the_username = matching_usernames.first

   the_username.username = new_username
   the_username.save

      next_url = "/users/" + the_username.username.to_s
      redirect_to(next_url)
  
    end

    def create
      #Parameters: {"input_username"=>"New_USER", "path_username"=>"insert_user_record"}

      input_username = params.fetch("input_username")

      a_new_user = User.new
      a_new_user.username = input_username
      a_new_user.save

      next_url = "/users/" + a_new_user.username.to_s
      redirect_to(next_url)
      
    end

  

end
