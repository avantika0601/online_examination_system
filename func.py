import mysql.connector
import streamlit as st

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="online_exam_system"
)
c = mydb.cursor()


c.execute("Select score from takes_test where user_id=11342 and test_id=31")
res=c.fetchall()
a=res[0][0]
print(type(a))
c.execute("Select *from isEligible_for(a)")
b=c.fetchall()
print(b)
