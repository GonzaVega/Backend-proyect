class Conference < ApplicationRecord
    belongs_to :user
    has_many :users
    validates :title, presence: true, length: {minimum: 6, maximum: 100}
    validates :abstract, presence: true, length: {minimum: 10, maximum: 300}
end
