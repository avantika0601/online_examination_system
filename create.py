import streamlit as st
from database import add_data,show_tables,get_attributes

# put different UI for different tables
# what if all values are not given
def create():
    
    tables_list = show_tables()
    table = st.selectbox("Select table", tables_list)
    attributes = get_attributes(table)
    new_val=[]
    for i in range(len(attributes)):
        val = st.text_input(f"enter {attributes[i]} ")
        new_val.append(val)
    
    if st.button("Add"):
        add_data(table,new_val)
        st.success("insertion was successful")
        
