# frozen_string_literal: true

# require 'rails_helper'

# module Mutations
#   module SignInUser
#     RSpec.describe SignInUser, type: :request do
#       describe '.resolve' do
#         def query
#           <<~GQL
#           mutation {
#             SignInUser(             
#                 email: "email@example.com"
#                 password: "123456"
#                }
#               }  
#             ) {
#                 token
#                   user {
#                     id
#                   }
#                }
#             }
#           GQL
#         end


#       end

# WIP - convert to RSpec syntax

# class Mutations::SignInUserTest < ActiveSupport::TestCase
#   def perform(args = {})
#     Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(**args)
#   end

#   def create_user
#     User.create!(
#       name: 'Test User',
#       email: 'email@example.com',
#       password: '[omitted]',
#     )
#   end

#   test 'success' do
#     user = create_user

#     result = perform(
#       credentials: {
#         email: user.email,
#         password: user.password
#       }
#     )

#     assert result[:token].present?
#     assert_equal result[:user], user
#   end

#   test 'failure because no credentials' do
#     assert_nil perform
#   end

#   test 'failure because wrong email' do
#     create_user
#     assert_nil perform(credentials: { email: 'wrong' })
#   end

#   test 'failure because wrong password' do
#     user = create_user
#     assert_nil perform(credentials: { email: user.email, password: 'wrong' })
#   end
# end
