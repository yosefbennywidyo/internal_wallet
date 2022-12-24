class Wallet < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'owner_id', primary_key: 'code',  optional: true
  belongs_to :team, class_name: 'Team', foreign_key: 'owner_id', primary_key: 'code',  optional: true
  belongs_to :stock, class_name: 'Stock', foreign_key: 'owner_id', primary_key: 'code',  optional: true

  validates :owner_id, allow_blank: false, uniqueness: true
end
