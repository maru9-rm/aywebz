# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  nickname   :string
#  path       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar

    def grade
        return '不明' unless birthday.present?
        # birthdayがなければ不明と返す
        t = Time.now + 274.days
        bd = birthday + 274.days
        years = t.year - bd.year
    
        return "中学#{years - 12}年生"
    end



end
