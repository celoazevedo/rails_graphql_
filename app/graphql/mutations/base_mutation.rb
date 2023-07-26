module Mutations
  # This class is used as a parent for all mutations, and it is the place to have common utilities
  # https://graphql-ruby.org/type_definitions/input_objects
  class BaseMutation < GraphQL::Schema::Mutation
  # class BaseMutation < GraphQL::Schema::RelayClassicMutation
  # (RelayClassicMutation inserts an automatically-generated 
  # input: argument to your configured mutation. It looks like you're defining input: manually, so you don't need that generated argument.
  # In fact, the generated argument is getting in your way!)
    null false
    argument_class Types::BaseArgument
    # This is used for return fields on the mutation's payload
    field_class Types::BaseField
    # This is used for generating the `input: { ... }` object type
    # input_object_class Types::BaseInputObject
    # This is used for generating payload types
    object_class Types::BaseObject
  end
end
