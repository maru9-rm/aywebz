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
class Task < ApplicationRecord
    has_many :achievements
    enum subject: { japanese: 0, math: 1, socialstudy: 2, science: 3, english: 4, other: 5 }
end
