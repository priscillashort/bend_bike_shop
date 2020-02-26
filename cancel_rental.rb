require_relative "cancel_rental_workflow"
require_relative "rental_database"

#create rental database and date to pass to the workflow
#define the renatl database class

rental_database = RentalDatabase.fake

cancel_rental_workflow = CancelBikeWorkFlow.new(rental_database)

cancel_rental_workflow.run


#Should ask the workflow for a result

