# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  liked_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  liked_type :string
#

class Like < ApplicationRecord
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :liked, polymorphic: true

end
