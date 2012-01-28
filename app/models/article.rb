class Article < ActiveRecord::Base
  default_scope :order => "id desc"
  validates :title,:presence => true
end
