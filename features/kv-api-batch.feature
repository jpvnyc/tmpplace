Feature: kv-api-batch
  Scenario: Read input file
    When I run `ruby -S kv-api-batch.rb somefile`
    Then it should pass with:
      """
      Argument: somefile
      """

  Scenario: Read input file
    When I run `ruby -S kv-api-batch.rb somefile`
    Then it should pass with:
    """
    Argument: somefile
    """
