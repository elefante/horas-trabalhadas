# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_horas_trabalhadas_session',
  :secret      => '4d7f0fe84f779f28eda75f0d219d8af255541db688f1b5a762ab720a8bba74c36efbc0a7d2b4f1289c9690c96eca7fb54b7416ebb32d663466f1ddbb202541e6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
