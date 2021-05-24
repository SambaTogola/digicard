# == Schema Information
#
# Table name: subscription_packs
#
#  id          :bigint           not null, primary key
#  name        :string
#  price       :decimal(, )
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SubscriptionPackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
