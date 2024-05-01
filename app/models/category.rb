# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, length: { minimum: 4, maximum: 100 }
  validates :name, uniqueness: true
end
