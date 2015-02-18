get '/' do
  erb :index
end

post '/spaces' do
  text_to_change = params[:text]
  content_type :json
  fix_spaces(text_to_change).to_json
end