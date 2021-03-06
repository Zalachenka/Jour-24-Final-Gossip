class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :recipient_to_pm_links, foreign_key: 'recipient_id'
  has_many :received_messages, foreign_key: 'received_message_id', class_name: "PrivateMessage", through: :recipient_to_pm_links
#  validates :first_name, presence: true, length: { in: 6..100 }
#  validates :last_name, presence: true, length: { in: 6..100 }
#  validates :description, presence: true, length: { in: 2..200 }
  #validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }, , length: { in: 3..300 }
#  validates :age, presence: true, length: { in: 1..3 }
#  validates :city_id, presence: true
end
