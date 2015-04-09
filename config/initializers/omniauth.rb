# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :facebook, "1615588265337630", "02e2bdb809a465fa5820d404e3566c39" 
end