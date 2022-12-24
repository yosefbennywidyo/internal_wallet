class Client < ApplicationRecord
  include SharedMethod

  self.abstract_class = true
  self.primary_key    = :code
  
  with_options presence: true, allow_blank: false, uniqueness: true do
    validates :email
    validates :name
  end
  
  has_one :wallet, foreign_key: 'owner_id', primary_key: 'code', dependent: :destroy
  has_many :transaction_histories, foreign_key: 'owner_id', primary_key: 'code'

  before_create do
    self.code = generate_uniq_key({selected: 1, email: self.email})
  end

  after_commit(on: :create) do
    owner_id  = generate_uniq_key({selected: 1, email: self.email})
    address   = generate_uniq_key({selected: 2, email: self.email})
    
    self.create_wallet(owner_id: "#{owner_id}", address: "#{address}")
  end
end
