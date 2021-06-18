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
#  status               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
