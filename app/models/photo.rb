# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer
#

class Photo < ActiveRecord::Base
  attr_accessible :name, :url
  belongs_to :album
end
