# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_authcan_easyroller_session',
  :secret => 'e6c5f8d1582ebd918a0e67485d8d81bcb9771e86de6e0d6c17753cc782d5bf525691791b1f3967409829b53c2e6c150022fda625395d7904009e8efaa1f18f0f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
