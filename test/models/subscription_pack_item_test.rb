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

require 'test_helper'

class SubscriptionPackItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
