# Used for matching a step to create a root level document or documents.
#
# @example Steps for generating a document
#   Scenario: Create A Document
#     Given the following person document:
#       | title        | dob        |
#       | Grand Poobah | 1976/10/31 |
#
# @param [ String ] model The name of the model to create.
# @param [ Table ] table The table of values.
Given %r{^the following (.+) document:$} do |model, table|
  factory.create(model, table).tap do |document|
    instance_variable_set("@#{model}", document)
  end
end

# Used for determining if documents with specific attributes exist in the
# database.
#
# @example Steps for checking a document's existence.
#   Scenario: Check For A Document
#     Then a person document should be persisted with:
#       | title        | dob        |
#       | Grand Poobah | 1976/10/31 |
#
# @param [ String ] model The name of the model to create.
# @param [ Table ] table The table of values.
Then %r{a (.+) document should be persisted with:$} do |model, table|
  matchers.exists?(model, table).should be_true
end
