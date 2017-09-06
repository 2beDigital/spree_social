
# Add gem "omniauth-linkedin" to yout gemfile and uncomment this two lines to add linkedin
# SpreeSocial::OAUTH_PROVIDERS << ['LinkedIn', 'linkedin']
# SpreeSocial.init_provider('linkedin')

if ActiveRecord::Base.connection.table_exists? 'spree_authentication_methods'
  Spree::AuthenticationMethod.where(environment: Rails.env, provider: 'facebook').first_or_create do |auth_method|
    auth_method.api_key = ENV['FACEBOOK_APP_ID']
    auth_method.api_secret = ENV['FACEBOOK_APP_SECRET']
    auth_method.active = true
  end
  Spree::AuthenticationMethod.where(environment: Rails.env, provider: 'twitter').first_or_create do |auth_method|
    auth_method.api_key = ENV['TWITTER_APP_ID']
    auth_method.api_secret = ENV['TWITTER_APP_SECRET']
    auth_method.active = true
  end
  # Uncomment for use linkedin
  # Spree::AuthenticationMethod.where(environment: Rails.env, provider: 'linkedin').first_or_create do |auth_method|
  #   auth_method.api_key = ENV['LINKEDIN_APP_ID']
  #   auth_method.api_secret = ENV['LINKEDIN_APP_SECRET']
  #   auth_method.active = true
  # end
end