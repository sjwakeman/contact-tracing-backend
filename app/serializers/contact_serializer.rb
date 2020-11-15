class ContactSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :category, :location, :occurrence, :individual_id, :individual_name, :individual
  #  # REFRESH WSL WEBPAGE
  # GET http://localhost:3000/api/v1/contacts 500 (Internal Server Error)
    # getContacts @ index.js:16
    # (anonymous) @ index.js:5
    # index.js:21 Uncaught (in promise) TypeError: Cannot read property 'forEach' of undefined
    
  # attributes :name, :date, :category, :location, :occurrence, :individual_id, :individual
  # belongs_to :individual  # ADD RELATIONSHIPS TO SERIALIZER # WORKS # Includes Relationships Object
end
