# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_binaryme_session',
  :secret      => 'd25fc7180ffe94685138c43773ddd3b9ca2829b21cb9e305fc55599c872579ecedc6730a2b85e40dcca45beb423ee35ed2b85521b1c48edebc33f9e557a04e4a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
