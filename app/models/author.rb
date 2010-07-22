class Author < ActiveRecord::Base
  has_many :blogs
  validates_size_of :name, :maximum => 50
  validates_presence_of :name, :on => :create
end
