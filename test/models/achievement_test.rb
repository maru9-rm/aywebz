# == Schema Information
#
# Table name: achievements
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_achievements_on_task_id  (task_id)
#  index_achievements_on_user_id  (user_id)
#
require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
