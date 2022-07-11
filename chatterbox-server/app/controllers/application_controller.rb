class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes

  get '/messages' do
    messages = Message.all.order(:created_at)
    messages.to_json
  end

  post '/messages' do
    new_message = Message.create(
      username: params[:username],
      body: params[:body]
    )
    new_message.to_json
  end

  patch '/messages/:id' do
    update_message = Message.all.find(params[:id])
    update_message.update(body: params[:body])
    update_message.to_json
  end

  delete '/messages/:id' do
    delete_message = Message.all.find(params[:id])
    delete_message.destroy
    delete_message.to_json
  end
  
end
