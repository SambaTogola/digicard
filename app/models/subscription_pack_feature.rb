# == Schema Information
#
# Table name: subscription_pack_features
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubscriptionPackFeature < ApplicationRecord
  belongs_to :user
end
