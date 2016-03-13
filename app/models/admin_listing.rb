class AdminListing < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end
