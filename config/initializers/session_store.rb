# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter_topics_session',
  :secret      => '8fce72e94be4e5ed841e5299903a1f6172bf5e79f39d6c2fca7e20ec9d012ca960bc40c7a640301011a9537a3af87865352b41cd3f6b9f956df8c4fff5a7c6c5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
