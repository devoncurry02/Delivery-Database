import mysql.connector
import matplotlib.pyplot

database = mysql.connector.connect(host="localhost",user="root",password="Talllegodude10",database="delivery_database")

print("(users, orders, deliveries)\nSelect a table to display: ")
selection = input().strip("\n").lower()

if selection == "users":
    cursor = database.cursor()
    cursor.execute("SELECT * FROM users")

elif selection == "orders":
    cursor = database.cursor()
    cursor.execute("SELECT * FROM orders o INNER JOIN users u ON o.user_id = u.user_id")

elif selection == "deliveries":
    cursor = database.cursor()
    cursor.execute("SELECT * FROM deliveries d INNERdeli JOIN orders o ON d.order_id = o.order_id")

results = cursor.fetchall()
for row in results:
    print(row)