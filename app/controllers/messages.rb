post '/messages' do 
	user = User.create(:name => "Sam",
								:username => 'samsam',
								:email => "sam@example.com",
								:password => "cat",
								:password_confirmation => "cat")
	title = params["title"]
	text = params["text"].to_s
	Message.create(:title => title, :text => text)
	redirect to('/')
end

get '/messages/new' do 
	erb :"messages/new"
end