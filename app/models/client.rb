class Client < ApplicationRecord
  self.abstract_class = true

  with_options presence: true, allow_blank: false, uniqueness: true do
    validates :email
    validates :name
  end
end
