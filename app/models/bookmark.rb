class Bookmark < ApplicationRecord
  validates :comment, length: {minimum: 6}
  validates :list, uniqueness: {scope: :movie}
  belongs_to :list
  belongs_to :movie
end
