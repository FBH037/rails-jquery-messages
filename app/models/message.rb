class Message < ActiveRecord::Base
  serialize :labels, Array
  # accepts_nested_attributes_for :message
  def unread
    !read
  end
end
