Jukebox::App.controllers :tracks do

  
  get '/play/:id' do
    @track = Track.find(params[:id]).first  
    client = Soundcloud.new(:client_id => '398adc82aeeaedd7bed5f77f5c29d0c1') 
    @sound_cloud_widget = client.get('/oembed', :url => @track.permalink_url)['html']
    render 'tracks/play'
  end

  get :index do
    render :index
  end

  get :search do
    render 'tracks/search'
  end

  post :search do
    @results = Track.search(params[:name])


    render 'tracks/index'
  end



end
