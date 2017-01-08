get "/login" do 
	erb :"sessions/new.html"
end

post "/sessions"
	@user = User.find_by(full_name: params[:full_name])
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
		p @error
		erb :"/sessions/new.html"
	end
end   

delete '/logout' do
	logout
	redirect '/'
end
