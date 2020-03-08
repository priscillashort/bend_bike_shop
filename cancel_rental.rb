require_relative "cancel_rental_workflow"
require_relative "rental_database"
require_relative "inventory"

rental_database = RentalDatabase.fake
inventory = Inventory.fake

cancel_rental_workflow = CancelBikeWorkFlow.new(rental_database,inventory)

cancel_rental_workflow.run


