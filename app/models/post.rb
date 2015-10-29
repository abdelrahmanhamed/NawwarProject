class Post < ActiveRecord::Base
	belongs_to :user
	mount_uploader :img, AvatarUploader
end
