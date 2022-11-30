# Importing pakages
import streamlit as st
import mysql.connector

from create import  create
#from database import create_table
from delete import delete
from read import read
from update import update
from query_box import QueryBox


def main():
    st.title("ONLINE EXAMINATION SYSTEM")
    menu = ["Add", "View", "Edit", "Remove","Query Box"]
    choice = st.sidebar.selectbox("Menu", menu)

    #create_table()
    if choice == "Add":
        st.subheader("Enter Candidate Details:")
        create()

    elif choice == "View":
        st.subheader("View Candidates")
        read()

    elif choice == "Edit":
        st.subheader("Update candidate details")
        update()

    elif choice == "Remove":
        st.subheader("Delete candidate from the list")
        delete()

    elif choice == "Query Box":
        st.subheader("Query Window")
        QueryBox()

    else:
        st.subheader("About tasks")
    
    def add_bg_from_url():
        st.markdown(
         f"""
         <style>
         .stApp {{
             background-image: url("https://wallpaperaccess.com/full/3386016.jpg");
             background-attachment: fixed;
             background-size: cover
         }}
         </style>
         """,
         unsafe_allow_html=True
     )

    add_bg_from_url() 
       


if __name__ == '__main__':
    main()

#constraints
#errors
#exceptions
#peer review
#UI
#any other creative thing to be added
#statstical analysis if time permits
#login and grant permissions
