# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ouestmaperceuse_session',
  :secret      => '97686719b181468cd9042f17ebdc77728b0bf2d1b0bb9fb64d9269b1a1b0b6c3214dfe230c46df6bf70268ac4f4344b4138cdfb8ef8e1b2a8a53d2a7503fa056'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
