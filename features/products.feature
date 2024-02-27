Feature: The product store service back-end
    As a Product Store Owner
    I need a RESTful catalog service
    So that I can keep track of all my products

Background:
    Given the following products
        | name       | description     | price   | available | category   |
        | Hat        | A red fedora    | 59.95   | True      | CLOTHS     |
        | Shoes      | Blue shoes      | 120.50  | False     | CLOTHS     |
        | Big Mac    | 1/4 lb burger   | 5.99    | True      | FOOD       |
        | Sheets     | Full bed sheets | 87.00   | True      | HOUSEWARES |

Scenario: The server is running
    When I visit the "Home Page"
    Then I should see "Product Catalog Administration" in the title
    And I should not see "404 Not Found"

Scenario: Create a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hammer"
    And I set the "Description" to "Claw hammer"
    And I select "True" in the "Available" dropdown
    And I select "Tools" in the "Category" dropdown
    And I set the "Price" to "34.95"
    And I press the "Create" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    Then the "Id" field should be empty
    And the "Name" field should be empty
    And the "Description" field should be empty
    When I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hammer" in the "Name" field
    And I should see "Claw hammer" in the "Description" field
    And I should see "True" in the "Available" dropdown
    And I should see "Tools" in the "Category" dropdown
    And I should see "34.95" in the "Price" field

Scenario: Read a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I click in the "Search" button
    Then I see the message "Success"
    When I copy the "Id" field
    And I click in the "Clear" button
    And I paste the "Id"
    And I press the "Retrieve" button
    Then I see the message "Success"
    And I see "Hat" in the "Name" field
    And I should see "A red fedora" in the "Description" field 
    And I should see "True" in the "Available" dropdown 
    And I should see "Cloths" in the "Category" dropdown
    And I should see "59.95" in the "Price" field

Scenario: Update a Product
    When I visit the "Home Page"
    And I type a "Name" that exists in the "Background"
    And I press the "Search" button
    Then I should see the message "Sucess"
    And The field has an expected value
    When I press the "Update" button
    Then I see the message "Sucess"
    And I copy the "Id" field
    And Clear the form
    And paste the "Id" on field
    When I press the "Retrieve" button
    Then I should see the message "Sucess"
    And Check the value updated of the field
    When I press the "Clear" button followed by the "Search" button
    Then I should see the changed fields in the results 

Scenario: Delete a Product
    When I visit the "Home Page"
    And I type a "Name" that exists in the "Background"
    And I press the "Search" button
    Then I should see the message "Sucess"
    And The field has an expected value
    When I press the "Delete" button
    Then I should see the message "Deleted!"
    When I press the "Clear" button followed by the "Search" button
    Then I should see the product is not in the results

Scenario: List all products
    When I visit the "Home Page"
    And I press the "Clear" button to remove the previous entries made.
    And I press the "Search" button
    Then I Should see the message “Success” 
    And I Should see all the products in the results.

Scenario: Search by category
    When I visit the "Home Page"
    And Select the "Food" category 
    And press the "Search" button
    Then I Should see the message “Success” 
    And I Should see all the Products based on category in the results
    And I Should not see other category from the Background data in the results

Scenario: Search by available
    When I visit the "Home Page"
    And I press the "Clear" button to clear out the default dropdown selections
    And I set "Available" dropdown to "True" 
    And press the "Search" button
    Then I Should see the message “Success” 
    And I Should see all the Products available in the results

Scenario: Search by name
    When I visit the "Home Page"
    And I type a "Name" that exists in the "Background"
    And I press the "Search" button
    Then I Should see the message “Success”
    And I Should see the "Name"  based on my searching 
    And I Should see the "Description" based on searching
