class Action < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :client_status
  belongs_to :sales_status

  with_options presence: true do
    validates :title
    validates :client
    validates :price
    validates :client_status, numericality: { other_than: 1 } 
    validates :sales_status,  numericality: { other_than: 1 } 
    validates :memo
    validates :knowledge
    validates :userforeign_key: true
  end

  belongs_to :performance
  belongs_to :user


end
