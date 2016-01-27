json.array!(@employees) do |employee|
  json.extract! employee, :id, :firstname, :midname, :lastname, :pesel, :address, :city, :state, :postal, :country, :phone, :gender, :department, :birthdate, :hiredate, :email, :hrsperweek, :wage, :nationality, :marital
  json.url employee_url(employee, format: :json)
end
