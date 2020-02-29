require_relative "return_bike_workflow"
require_relative "rental_database"

rental_database = RentalDatabase.fake

workflow = ReturnBikeWorkFlow.new(rental_database)

workflow.run