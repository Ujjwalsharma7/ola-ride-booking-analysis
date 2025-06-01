CREATE DATABASE Ola;
USE ola;

SELECT * FROM bookings;

#  1 Retrieve all successful bookings
 CREATE view Successful_Bookings As
 SELECT * 
 FROM bookings
 WHERE Booking_Status = "Success";
 
 SELECT * FROM Successful_Bookings;
 
 #2 Find avg ride distance for each vehicle type
 CREATE VIEW ride_distance_for_each_vehicle as
 SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance
 FROM bookings
 GROUP BY Vehicle_Type;
 
 #3 Get the total number of cancelled rides by customers
 CREATE VIEW Number_of_rides_canceled_by_customer as
 SELECT COUNT(*)
 FROM Bookings
 WHERE Booking_Status = "Canceled by Customer";
 
#4 List top 5 customers who booked max number of rides
CREATE VIEW Top_5_customers as
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

#5 Number of rides cancelled by driver due to personal or car related issues
CREATE VIEW rides_cancelled_by_driver_due_to_personal_or_car_related_issues as
SELECT COUNT(*)
FROM Bookings
WHERE Canceled_Rides_by_Driver = "Personal & Car related issue";

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_rating_prime_sedan as
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan';
SELECT * from Max_Min_rating_prime_sedan;

#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW PAYMENT_METHOD_UPI AS
SELECT * FROM bookings WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
CREATE VIEW AVG_RATING_PER_VEHICLE_TYPE AS
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;
 
#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW Total_revenue as
SELECT SUM(Booking_Value) as total_successful_value FROM bookings WHERE
Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
CREATE VIEW Inomplete_rides_with_reasons as
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides =
'Yes';
 

 
 
 
 
 


