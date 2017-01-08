get "/login" do 
	erb :"sessions/new.html"
end

post "/sessions" do 
	@user = User.find_by(username: params[:username])
	if @user 
		if @user.password == params[:password]
			login(@user)
			redirect '/'
		else
			@error = "Invalid password"
			erb :"/sessions/new.html"
		end
	else 
		@error = "Invalid username or password"
		erb :"/sessions/new.html"
	end
end   

delete '/logout' do
	logout
	redirect '/'
end
