class ContactSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :category, :location, :occurrence, :individual_id, :individual 
  # belongs_to :individual  # ADD RELATIONSHIPS TO SERIALIZER # WORKS
end
