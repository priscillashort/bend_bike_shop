require_relative "mountain_bike"
require_relative "road_bike"
require_relative "tricycle"
require_relative "flatwater_kayak"
require_relative "whitewater_kayak"

module RentalType 

	def bike_model_config
		{
			"Mountain Bike" => MountainBike,
			"Road Bike" => RoadBike,
			"Tricycle" => Tricycle
		}
	end

	def kayak_model_config
		{
			"Flatwater" => FlatwaterKayak,
			"Whitewater" => WhitewaterKayak
		}
	end

	def rentable_type_config
		{
			"Bike" => bike_model_config,
			"Kayak" => kayak_model_config
		}
	end
  
end