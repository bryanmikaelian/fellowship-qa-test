class Blog < ActiveRecord::Base
  belongs_to :author
  validates_presence_of :name, :post,  :on => :create


  def author_name(blog)
    if Author.find(:all).empty?
      "Anonymous"
    else
      blog.author.name
    end
  end
  
end
