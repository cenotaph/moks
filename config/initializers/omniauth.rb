Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_app_id'], ENV['facebook_secret'] , token_params: { parse: :json },
    client_options: {
      site: 'https://graph.facebook.com/v3.0',  # this is the example API version
      authorize_url: "https://www.facebook.com/v3.0/dialog/oauth"
    }#, {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
  provider :twitter, ENV['twitter_consumer_key'], ENV['twitter_consumer_secret']
  provider :google_oauth2, ENV["google_client_id"], ENV["google_client_secret"], {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}

end
