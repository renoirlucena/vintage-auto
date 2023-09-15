# generate_secret_key.rb
require 'securerandom'

# Generate a random secret key (64 characters long)
secret_key = SecureRandom.hex(32)

puts "Generated secret key: #{secret_key}"

