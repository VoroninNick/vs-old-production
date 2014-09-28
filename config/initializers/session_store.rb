# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_studio_session',
  :secret      => '43af017dcf93f98e6566cacbfdf3d3d658fb091fed38ff6a1d44c4a230f2898602e252a716c3e396ec5267c9eefe4af847699ed7fef6362ead780cb8b0d55314'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
