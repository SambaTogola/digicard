# == Schema Information
#
# Table name: subscription_pack_features
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubscriptionPackFeature < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :user
end
