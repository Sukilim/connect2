class Instruction < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end
