class Person
  include Mongoid::Document
  field :title, :type => String
  field :dob, :type => Date
end
