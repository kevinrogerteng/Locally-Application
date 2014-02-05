module UsersHelper

	def check_user 
		user_check = current_user.id
		user_being_checked = params[:id].to_i
		if user_check == user_being_checked
			return true
		else
			return false
		end
	end
end
