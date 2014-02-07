# == Schema Information
#
# Table name: activities
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  address         :string(255)
#  phone           :string(255)
#  biz_url         :string(255)
#  thumbnail_photo :string(255)
#  rating          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  trip_id         :integer
#  yid             :string(255)
#

class Activity < ActiveRecord::Base
	belongs_to :trip

	validates :name, presence: true
end
