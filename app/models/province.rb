class Province < ActiveRecord::Base
  attr_accessible :name

  has_many :locations
  has_many :orgs, through: :locations

  searchable :auto_index => true, :auto_remove => true do
    text :name
  end
end
