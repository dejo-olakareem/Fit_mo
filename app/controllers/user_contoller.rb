get '/users' do

  @users = User.all #define instance variable for view

  erb :"users/index.html" #show all users view (index)

end



get '/users/new' do

  erb :"users/new.html" #show new users view

end



post '/users' do

  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user

  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users/#{user.id}' #redirect back to users index page
  else
    erb :"users/new.html" # show new users view again(potentially displaying errors)
  end

end



get '/users/:id' do

  #gets params from url

  @user = User.find(params[:id]) #define instance variable for view

  erb :"users/show.html" #show single user view

end



get '/users/:id/edit' do

  #get params from url
  @user = User.find(params[:id]) #define intstance variable for view

  erb :"users/edit.html" #show edit user view

end


put '/users/:id' do

  #get params from url
  @user = User.find(params[:id]) #define variable to edit

  @user.assign_attributes(params[:user]) #assign new attributes

  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users/#{user.id}' #redirect back to users index page
  else
    erb :"users/edit.html" #show edit user view again(potentially displaying errors)
  end

end



delete '/users/:id' do

  #get params from url
  @user = User.find(params[:id]) #define user to delete

  @user.destroy #delete user

  redirect '/users' #redirect back to users index page

end
