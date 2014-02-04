# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email_address   :string(255)
#  screen_name     :string(255)
#  hometown        :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
	has_many :trips
	has_secure_password
	before_save :create_remember_token

	validates :email_address, uniqueness: true
	validates :password, confirmation: true, length: {in: 6..20}
	validates :password_confirmation, presence: true
end

private

    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end
