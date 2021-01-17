class ClientStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '既存'},
    { id: 3, name: '新規'}
  ]

  include ActiveHash::Associations
  has_many :plans

end
