class User < ApplicationRecord
	 include Clearance::User
	 enum access_level: [:customer, :moderator, :superadmin]

	 has_many :listings
	 has_many :authentications, dependent: :destroy
	 has_many :reservations
	 mount_uploader :profile_picture, ProfilePictureUploader

	 def self.create_with_auth_and_hash(authentication, auth_hash)
	   user = self.create!(

	     first_name: auth_hash["info"]["first_name"],
	     last_name: auth_hash["info"]["last_name"],
	     username: auth_hash["info"]["username"],	
	     email: auth_hash["info"]["email"],
	     image: auth_hash["info"]["image"],
	     password: SecureRandom.hex(10)
	   )
	   user.authentications << authentication
	   return user
	 end

	 # grab google to access google for user data
	 def google_token
	   x = self.authentications.find_by(provider: 'google_oauth2')
	   return x.token unless x.nil?
	 end
end
