class Link < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates_presence_of :url
end