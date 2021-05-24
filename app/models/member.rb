# == Schema Information
#
# Table name: members
#
#  id              :bigint           not null, primary key
#  invitation_id   :bigint
#  organization_id :bigint
#  service_id      :bigint
#  position        :string
#  status          :string
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Member < ApplicationRecord
  belongs_to :invitation
  belongs_to :organization
  belongs_to :service
  belongs_to :user
end
