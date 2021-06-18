# == Schema Information
#
# Table name: invitations
#
#  id              :bigint           not null, primary key
#  uid             :string
#  organization_id :bigint
#  service_id      :bigint
#  position        :string
#  description     :text
#  status          :string
#  user_id         :bigint
#  recipient_id    :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
