class ApplicationController < Sinatra::Base
  #set :session_secret, "my_application_secret"
  #register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :'/application/root'
  end

end