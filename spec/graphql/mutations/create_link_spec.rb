require 'rails_helper'

module Mutations
  module Links
    RSpec.describe CreateLink, type: :request do
      describe '.resolve' do
        it 'creates a link' do
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
        # it 'returns an error with no firstName input' do
        #   def query_nofirst
        #     <<~GQL
        #     mutation {
        #       createUser(
        #       input: {
        #         firstName: ""
        #         lastName: "Skywalker"
        #         username: "usetheforce"
        #       }
        #       ) {
        #         user {
        #           firstName
        #           lastName
        #           username
        #           }
        #         }
        #       }
        #     GQL
        #   end
        #   post '/graphql', params: { query: query_no_url }
          
        #   json = JSON.parse(response.body)
        #   expect(json).to be_a(Hash)
        #   expect(json['errors']).to be_an(Array)
        #   expect(json['errors'][0]['message']).to be_a(String)
        #   expect(json['errors'][0]['message']).to eq("Cannot return null for non-nullable field CreateUserPayload.user")
        # end
        
        # it 'returns an error with no lastName input' do
        #   def query_nolast
        #     <<~GQL
        #     mutation {
        #       createUser(
        #       input: {
        #         firstName: "Luke"
        #         lastName: ""
        #         username: "usetheforce"
        #       }
        #       ) {
        #         user {
        #           firstName
        #           lastName
        #           username
        #           }
        #         }
        #       }
        #     GQL
        #   end
        #   post '/graphql', params: { query: query_nolast }
          
        #   json = JSON.parse(response.body)
        #   expect(json).to be_a(Hash)
        #   expect(json['errors']).to be_an(Array)
        #   expect(json['errors'][0]['message']).to be_a(String)
        #   expect(json['errors'][0]['message']).to eq("Cannot return null for non-nullable field CreateUserPayload.user")
        # end
        
        # it 'returns an error with no username input' do
        #   def query_nousername
        #     <<~GQL
        #     mutation {
        #       createUser(
        #       input: {
        #         firstName: "Luke"
        #         lastName: "Skywalker"
        #         username: ""
        #       }
        #       ) {
        #         user {
        #           firstName
        #           lastName
        #           username
        #           }
        #         }
        #       }
        #     GQL
        #   end
        #   post '/graphql', params: { query: query_nousername }
          
        #   json = JSON.parse(response.body)
        #   expect(json).to be_a(Hash)
        #   expect(json['errors']).to be_an(Array)
        #   expect(json['errors'][0]['message']).to be_a(String)
        #   expect(json['errors'][0]['message']).to eq("Cannot return null for non-nullable field CreateUserPayload.user")
        # end
      end

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
            }
         }
       GQL
     end
    end
  end
end