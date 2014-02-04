# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  destination :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

class Trip < ActiveRecord::Base
	belongs_to :user
	has_many :activities

	validates :name, presence: true
	validates :destination, presence: true
	validates :description, length: {maximum: 500}
end
