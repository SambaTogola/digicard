class SubscriptionPackItem < ApplicationRecord
  belongs_to :subscription_pack
  belongs_to :subscription_pack_feature
  belongs_to :user
end
