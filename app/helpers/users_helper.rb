module UsersHelper

	def check_user 
		if current_user == nil
			return "signin"
		else
		user_check = current_user.id
		user_being_checked = params[:id].to_i
			if user_check != user_being_checked
				return false
			else
				return true
			end
		end
	end
end
