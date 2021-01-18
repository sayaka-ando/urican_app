class Performance < ApplicationRecord
  with_options presence: true do
    validates :goal,  format: { with: /\A[0-9]+\z/ }, numericality: true
  end

  belongs_to :user

end
