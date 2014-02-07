module ActivitiesHelper

	def validate new_activity

		if new_activity.thumbnail_photo == ""
			new_activity.update_attribute(:thumbnail_photo, "http://i.imgur.com/tCDTHfY.gif")
		end
	end

end
