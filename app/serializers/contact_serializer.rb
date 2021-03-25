class ContactSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :category, :location, :occurrence, :individual_id, :individual, :individual_name
  # belongs_to :individual  # ADD RELATIONSHIPS TO SERIALIZER # WORKS # Includes Relationships Object
end
