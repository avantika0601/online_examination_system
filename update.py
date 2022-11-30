import datetime

import pandas as pd
import streamlit as st
from database import view_all_data, view_only_candidate_names, get_candidate, edit_candidate_data


def update():
    result = view_all_data()
    # st.write(result)
    df = pd.DataFrame(result, columns=['user_id', 'user_name','First_Name','Last_name','college_organisation_name','email_id','phone_no'])
    with st.expander("Current Candidates"):
        st.dataframe(df)
    list_of_candidates = [i[0] for i in view_only_candidate_names()]
    selected_candidate = st.selectbox("Candidate to Edit", list_of_candidates)
    #say_anything="string"
    #st.text_input("your input:",say_anything)
    selected_result = get_candidate(selected_candidate)
    # st.write(selected_resul
    if selected_result:
        user_id = selected_result[0][0]
        user_name = selected_result[0][1]
        First_name = selected_result[0][2]
        Last_name = selected_result[0][3]
        college_organisation_name = selected_result[0][4]
        email_id = selected_result[0][5]
        phone_no = selected_result[0][6]
        
        

        # Layout of Create

        col1, col2 = st.columns(2)
        with col1:
            new_user_id = st.text_input("ID:",user_id)
            new_user_name = st.text_input("User Name:", user_name)
            new_First_name = st.text_input("First Name:", First_name)
            new_Last_name = st.text_input("Last Name:", Last_name)
        with col2:
            new_college_organisation_name = st.selectbox( college_organisation_name,["PES University", "REVA University", "RV College"])#small bug
            new_email_id = st.text_input("Email ID:", email_id)
            new_phone_no = st.text_input("Phone no:", phone_no)
        if st.button("Update Candidate"):
            edit_candidate_data(new_user_id,new_user_name,new_First_name,new_Last_name,new_college_organisation_name,new_email_id,new_phone_no ,user_id,user_name,First_name,Last_name,college_organisation_name,email_id,phone_no)
            st.success("Successfully updated")

    result2 = view_all_data()
    df2 = pd.DataFrame(result2,  columns=['user_id', 'user_name','First_Name','Last_name','college_organisation_name','email_id','phone_no'])
    with st.expander("Updated data"):
        st.dataframe(df2)
