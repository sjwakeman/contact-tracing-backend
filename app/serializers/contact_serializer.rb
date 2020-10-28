class ContactSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :category, :location, :occurrence, :individual_id, :individual 
end
