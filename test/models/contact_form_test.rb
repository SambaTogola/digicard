# == Schema Information
#
# Table name: contact_forms
#
#  id         :bigint           not null, primary key
#  uid        :string
#  full_name  :string
#  phone      :string
#  email      :string
#  object     :string
#  message    :text
#  read       :boolean
#  read_at    :datetime
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ContactFormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
