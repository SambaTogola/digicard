# == Schema Information
#
# Table name: invitations
#
#  id              :bigint           not null, primary key
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

class Invitation < ApplicationRecord
  belongs_to :organization
  belongs_to :service
  belongs_to :user
  belongs_to :recipient
end
