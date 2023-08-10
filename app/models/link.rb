# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :user, optional: true
  has_many :votes

  # Check so we can later add a validation that will check for a valid URL "URL validator"?
  validates :url, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
end
