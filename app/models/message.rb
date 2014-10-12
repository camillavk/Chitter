class Message

	include DataMapper::Resource

	property :id, 							Serial
	property :title,						String
	property :text, 						Text
	
end