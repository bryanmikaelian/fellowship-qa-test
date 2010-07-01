class Blog < ActiveRecord::Base
  belongs_to :author

  def author_name(blog)
    if Author.find(:all).empty?
      "Anonymous"
    else
      blog.author.name
    end
  end
  
end
