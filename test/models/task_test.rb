# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  criterion  :string
#  detail     :string
#  passday    :date
#  source     :string
#  status     :integer          default(0), not null
#  subject    :integer
#  testday    :date
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
