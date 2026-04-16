"""
The "FareCalc" Travel Optimizer
Business Case: A ride-sharing startup, "CityCab," needs a backend script to calculate fares. The fare isn't flat; it changes based on the time of day (Peak Hours) and the type of vehicle requested.
Problem Statement
Write a script that calculates the final "Ride Estimate" based on distance, vehicle type, and a "Surge Pricing" multiplier.
Student Tasks:
1.	Dictionary Mapping: Store rates in a dictionary: {'Economy': 10, 'Premium': 18, 'SUV': 25} (rates per km).
2.	Surge Logic: Ask the user for the "Hour of Day" (0-23). If the hour is between 17 and 20 (5 PM - 8 PM), apply a 1.5x Surge Multiplier to the total.
3.	Function Definition: Create a function calculate_fare(km, type, hour) that returns the final price.
4.	Error Handling: If the user enters a vehicle type not in your dictionary, use a try-except block or an if-in check to provide a "Service Not Available" message.
Deliverable: A .py script that takes user input and prints a formatted "Price Receipt."
"""

rates = {
    'Economy': 10,
    'Premium': 18,
    'SUV': 25
}

def calc_fare(km, veh_type, hour):
    if veh_type not in rates:
        return "Service not available "
    
    rate_per_km = rates[veh_type]
    
    total = km * rate_per_km
    
    if 17 <= hour <= 20:
        total = total * 1.5  
    return total

print("CityCab Fare Calculator Welcomes You!!!")

try:
    km = float(input("Enter distance (in km): "))
    vehicle_type = input("Enter vehicle type (Economy / Premium / SUV): ")
    hour = int(input("Enter hour of travel (0-23): "))
    
    fare = calc_fare(km, vehicle_type, hour)
    
    print("\nPRICE RECEIPT")
    
    if isinstance(fare, str):
        print(fare)
    else:
        print(f"Distance: {km} km")
        print(f"Vehicle: {vehicle_type}")
        print(f"Travel Hour: {hour}")
        
        if 17 <= hour <= 20:
            print("Surge Applied: YES (1.5x)")
        else:
            print("Surge Applied: NO")
        
        print(f"Total Fare: ₹{fare}")
    
except ValueError:
    print("Invalid input! ")