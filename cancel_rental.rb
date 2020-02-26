require_relative "cancel_rental_workflow"

#create rental database and date to pass to the workflow
#define the renatl database class

cancel_rental_workflow = CancelBikeWorkFlow.new

cancel_rental_workflow.run


#Should ask the workflow for a result

