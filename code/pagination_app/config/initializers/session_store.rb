# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pagination_test_session',
  :secret      => '47252e65cb7463f48ebc1f90230a35a900e077cd1cc2f299aa41660217637e90a8ee789f1d1e77078c83e9d105767eba727cf2ac8245cfd0b54671dfb58aea3c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
