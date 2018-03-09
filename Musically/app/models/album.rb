# == Schema Information
#
# Table name: albums
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  year             :integer          not null
#  studio_recording :boolean          default(TRUE)
#  band_id          :integer          not null
#

class Album <ApplicationRecord
  validates :title, presence: true
  validates :year, presence: true
  validates :studio_recording, presence: true 


  belongs_to :artist,
    class_name: :Band,
    foreign_key: :band_id
end
