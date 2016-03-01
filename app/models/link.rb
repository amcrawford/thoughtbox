class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true

  def print_read_status
    if self.read
      "Mark as Unread"
    else
      "Mark as Read"
    end
  end
end
