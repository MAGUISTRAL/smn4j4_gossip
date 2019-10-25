class Gossip1 < ApplicationRecord
  belongs_to :user
  has_many :tags through gossiptags
end
