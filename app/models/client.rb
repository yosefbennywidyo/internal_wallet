class Client < ApplicationRecord
  self.abstract_class = true
  self.primary_key = :code
  
  with_options presence: true, allow_blank: false, uniqueness: true do
    validates :email
    validates :name
  end
  
  has_one :wallet, foreign_key: 'owner_id', primary_key: 'code', dependent: :destroy

  before_create do
    generate_model_code
  end

  after_commit(on: :create) do
    self.create_wallet(owner_id: "#{Digest::MD5.hexdigest self.email}")
  end

  def generate_model_code
    self.code = "#{Digest::MD5.hexdigest self.email}"
  end
end
