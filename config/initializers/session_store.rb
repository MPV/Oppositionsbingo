# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oppositionsbingo_session',
  :secret      => '59f86ab2fc99b5a108bf1ef3ede26da5a382b3d93ccb85d0a02a4c14a1640173b11dc3b0165de667654df7d7863ab00470cf74ccd34fd65a9a0f7b94d1cdac00'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
