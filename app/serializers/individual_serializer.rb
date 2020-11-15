class IndividualSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :contacts
end
