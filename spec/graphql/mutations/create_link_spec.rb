require 'rails_helper'

module Mutations
  module Links
    RSpec.describe CreateLink, type: :request do
      describe '.resolve' do
        def query
          <<~GQL
          mutation {
            createLink(
              url: "http://example.com"
              description: "Some text"
            ) {
                id
                url
                description
                postedBy {
                  id
                }
               }
            }
          GQL
        end

        def query_no_url
          <<~GQL
          mutation {
            createLink(
            input: {
              url: ""
              description: "test description"
            }
            ) {
              link {
                id
                url
                description
                postedBy {
                  id
                  }
                }
              }
            }
          GQL
        end

        def query_no_description
          <<~GQL
          mutation {
            createLink(
            input: {
              url: "http://example.com"
              description: ""
            }
            ) {
              link {
                id
                url
                description
                postedBy {
                  id
                  }
                }
              }
            }
          GQL
        end

        it 'creates a link' do

          # WIP -- Need a way to create a user and sign them in for all tests in this file

          # def perform(args = {})
          #   Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(**args)
          # end

          # @user = User.find_or_create_by(name: 'Test User', email: 'user@example.com', password: 'abcdefgh')

          # # Must sign in the user
          # perform(
          #   credentials: {
          #     email: @user.email,
          #     password: @user.password
          #   }
          # )

          expect(Link.count).to eq(0)
          post '/graphql', params: {query: query}
          expect(Link.count).to eq(1)
        end
        
        it 'returns a link' do
          post '/graphql', params: { query: query }
          
          json = JSON.parse(response.body)
          data = json['data']['createLink']
          expect(data['url']).to eq('http://example.com')
          expect(data['description']).to eq('Some text')
        end

        it 'returns an error with no url input' do
          post '/graphql', params: { query: query_no_url }
          
          json = JSON.parse(response.body)
          expect(json).to be_a(Hash)
          expect(json['errors']).to be_an(Array)
          expect(json['errors'][0]['message']).to be_a(String)
          expect(json['errors'][0]['message']).to eq("Field 'createLink' is missing required arguments: description, url")
        end

        it 'returns an error with no description input' do
          post '/graphql', params: { query: query_no_description }
          
          json = JSON.parse(response.body)
          expect(json).to be_a(Hash)
          expect(json['errors']).to be_an(Array)
          expect(json['errors'][0]['message']).to be_a(String)
          expect(json['errors'][0]['message']).to eq("Field 'createLink' is missing required arguments: description, url")
        end
      end
    end
  end
end
