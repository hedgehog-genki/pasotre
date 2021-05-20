class Planning < ApplicationRecord
  belongs_to :user

  # validates :allowed_time, allowed_blank: false, numericality: {only_integer: true}, length: { in: 1..3 }
end
