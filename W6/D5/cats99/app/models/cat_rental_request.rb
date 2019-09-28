# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date
#  end_date   :date
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "date"
class CatRentalRequest < ApplicationRecord
    STATUS = %w(PENDING APPROVED DENIED)
    validates :status, presence: true, :inclusion => {:in => STATUS }
    validates :cat_id, presence: true
    validate :overlapping_requests

    belongs_to :cat

    private

    def overlapping_requests
      rented_cats = CatRentalRequest.where(cat_id: cat_id)
      rented_cats.each do |cat|
        if start_date <= cat.end_date || end_date <= start_date
          self.status = 'DENIED'
        end
      end
    end
end
