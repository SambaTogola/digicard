# == Schema Information
#
# Table name: subscriptions
#
#  id                   :bigint           not null, primary key
#  user_id              :bigint
#  subscription_pack_id :bigint
#  subscription_type_id :bigint
#  start_date           :datetime
#  end_date             :datetime
#  status               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription_pack
  belongs_to :subscription_type
end
