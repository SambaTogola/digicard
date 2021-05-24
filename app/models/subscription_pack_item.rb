# == Schema Information
#
# Table name: subscription_pack_items
#
#  id                           :bigint           not null, primary key
#  subscription_pack_id         :bigint
#  subscription_pack_feature_id :bigint
#  quantity                     :string
#  status                       :string
#  user_id                      :bigint
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class SubscriptionPackItem < ApplicationRecord
  belongs_to :subscription_pack
  belongs_to :subscription_pack_feature
  belongs_to :user
end
