# == Schema Information
#
# Table name: subscriptions
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  user_id              :bigint
#  subscription_pack_id :bigint
#  subscription_type_id :bigint
#  start_date           :datetime
#  end_date             :datetime
#  quantity             :integer
#  status               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Subscription < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :user
  belongs_to :subscription_pack
  belongs_to :subscription_type
end
