get '/users/new' do 
	@user = User.new
	erb :"users/new"
end

post '/users' do 
	@user = User.new(:name => params[:name],
							:email => params[:email],
							:password => params[:password],
							:password_confirmation => params[:password_confirmation])
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')
	else 
		flash[:notice] = "Sorry, your passwords don't match"
		erb :"users/new"
	end
end