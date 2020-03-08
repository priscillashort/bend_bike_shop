require_relative "mountain_bike"
require_relative "road_bike"
require_relative "tricycle"
require_relative "flatwater_kayak"
require_relative "whitewater_kayak"

module RentalSelection 

	def print_rentable_types
		rentable_type_config.keys.each_with_index do |k, i|
			puts "#{i + 1}. #{k}\n"
		end
	end

	def rentable_type(rentable_selection)
		rentable_type_config.keys[rentable_selection.to_i - 1]
	end

	def print_model_types(rentable_type)
		rentable_type_config[rentable_type].keys.each_with_index do |k, i|
			puts "#{i + 1}. #{k}\n"
		end
	end

	def model_type(rentable_type, model_selection)
		rentable_type_config[rentable_type].keys[model_selection.to_i - 1]
	end

	def model(rentable_type, model_type)
		rentable_type_config[rentable_type][model_type]	
	end

	private

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