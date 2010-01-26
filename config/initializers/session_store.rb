# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_prayervigil_session',
  :secret      => 'cb3eed4927296d37702ec9d66c6237775f1f51d405a368f00a754d0370135d53f5cb2909631bfc66d54ce50f4bbc0b0b0839a9708f1ce94b1f757ade8dff8a10'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
