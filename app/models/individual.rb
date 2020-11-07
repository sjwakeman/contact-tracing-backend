class Individual < ApplicationRecord
    has_many :contacts, dependent: :destroy
end
