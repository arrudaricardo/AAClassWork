# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "date"
class Cat < ApplicationRecord

  COLORS = %w(white black grey gold orange yellow)

  validates :birth_date, :description, :sex, :name, presence: true
  validates :color, presence: true, :inclusion => {:in => COLORS }

  has_many :cat_rental_requests,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy
  p
  def age
    ((Date.today - self.birth_date) / 365).to_i
  end


end
