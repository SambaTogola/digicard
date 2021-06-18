# == Schema Information
#
# Table name: services
#
#  id              :bigint           not null, primary key
#  uid             :string
#  organization_id :bigint
#  name            :string
#  description     :string
#  status          :string
#  parent_id       :bigint
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
