class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tag_gossip_links
  has_many :tags, through: :tag_gossip_links
  validates :title, length: { in: 6..50 }, presence: true
  validates :content, length: { in: 2..500 }, presence: true
end
