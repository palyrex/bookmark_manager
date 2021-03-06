class BookmarkManager < Sinatra::Base
  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :"sessions/new"
    end
  end

  get '/sessions/forgot_password' do
    erb :forgotten_password
  end

  delete '/sessions' do
    flash[:notice] = 'Good bye!'
    session[:user_id] = nil
    redirect to('/')
  end
end
