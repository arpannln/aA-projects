# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
  #rails 5 auto validates belongs_to associations 
  # validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: {scope: :viewer_id}
  
  belongs_to :artwork, 
  foreign_key: :artwork_id,
  class_name: 'Artwork'
  
  belongs_to :viewer, 
  foreign_key: :viewer_id, 
  class_name: 'User'
  
end
