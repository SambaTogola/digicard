# == Schema Information
#
# Table name: organizations
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  name                 :string
#  organization_type_id :bigint
#  activity_field_id    :bigint
#  slogan               :string
#  address              :string
#  city                 :string
#  state                :string
#  country              :string
#  phone                :string
#  email                :string
#  fax                  :string
#  zip_code             :string
#  web_site             :string
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
