require_relative "cancel_rental_workflow"
require_relative "rental_database"

rental_database = RentalDatabase.fake

cancel_rental_workflow = CancelBikeWorkFlow.new(rental_database)

cancel_rental_workflow.run



#Should ask the workflow for a result?

