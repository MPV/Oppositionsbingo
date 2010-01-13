# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bingo_session',
  :secret      => '6e986c6f8844c66c59e4db20bffcd1282cce377b3865b9bf6207505aaf695ab6fa2f4bd3f66cc2d1d8aa75da8fdd13c24001e0d9c8dfc40307fbf3e6e8db6833'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
