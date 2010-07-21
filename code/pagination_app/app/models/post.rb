class Post < ActiveRecord::Base

  def self.per_page
    5
  end
  
end
