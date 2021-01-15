class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '提案'},
    { id: 3, name: '受注'},
    { id: 3, name: '失注'}
  ]

  include ActiveHash::Associations
  has_many :actions
  
end
