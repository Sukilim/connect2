class MediaCoverage < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end

