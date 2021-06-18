# == Schema Information
#
# Table name: members
#
#  id              :bigint           not null, primary key
#  uid             :string
#  invitation_id   :bigint
#  organization_id :bigint
#  service_id      :bigint
#  position        :string
#  status          :string
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
