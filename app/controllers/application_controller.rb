class ApplicationController < Sinatra::Base
    configure do
      set :public_dir, "public"
    end
  
    get "/" do
      "Welcome to the project management app!"
    end
  end
  