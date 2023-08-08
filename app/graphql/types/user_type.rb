# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    # field :created_at, DateTimeType, null: false # Rails 7 compatibility issue: uninitialized constant Types::UserType::DateTimeType
    field :name, String, null: false
    field :email, String, null: false
    field :links, [LinkType], null: false
    field :votes, [VoteType], null: false
  end
end
