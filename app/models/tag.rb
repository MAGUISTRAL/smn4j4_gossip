class Tag < ApplicationRecord
has_many :gossip1s through gossiptags
end
