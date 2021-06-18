# == Schema Information
#
# Table name: subscription_pack_items
#
#  id                           :bigint           not null, primary key
#  uid                          :string
#  subscription_pack_id         :bigint
#  subscription_pack_feature_id :bigint
#  quantity                     :string
#  status                       :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class SubscriptionPackItem < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :subscription_pack
  belongs_to :subscription_pack_feature
  
  #belongs_to :user
end
