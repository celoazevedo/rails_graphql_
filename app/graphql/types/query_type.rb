module Types
  class QueryType < Types::BaseObject
    # Queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`
    field :all_links, [LinkType], null: false

    # Method invoked, when `all_link` fields is being resolved
    def all_links
      Link.all
    end
  end
end
