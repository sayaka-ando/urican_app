class Plan < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :client
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: true
    validates :client_status_id, numericality: { other_than: 1 } 
    validates :sales_status_id,  numericality: { other_than: 1 } 
  end

  # belongs_to :performance
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :client_status
  belongs_to :sales_status

end
