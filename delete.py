import pandas as pd
import streamlit as st
from database import view_all_data, view_only_candidate_names, delete_data,show_tables,view_table,get_attributes,get_all_values,delete_val,delete_table

#pop up message before you delete

def delete():
    # result = view_all_data()
    # df = pd.DataFrame(result, columns=['Dealer ID', 'Dealer Name', 'Dealer City', 'Dealer Pin', 'Dealer Street'])
    # with st.expander("Current data"):
    #     st.dataframe(df)

    # list_of_dealers = [i[0] for i in view_only_dealer_names()]
    # selected_dealer = st.selectbox("Task to Delete", list_of_dealers)
    # st.warning("Do you want to delete ::{}".format(selected_dealer))
    # if st.button("Delete Dealer"):
    #     delete_data(selected_dealer)
    #     st.success("Dealer has been deleted successfully") 
    # new_result = view_all_data()
    # df2 = pd.DataFrame(new_result, columns=['Dealer ID', 'Dealer Name', 'Dealer City', 'Dealer Pin', 'Dealer Street'])
    # with st.expander("Updated data"):
    #     st.dataframe(df2)


    tables_list = show_tables()
    table = st.selectbox("Select table", tables_list)
    result = view_table(table)
    attributes = get_attributes(table)
    df = pd.DataFrame(result, columns=attributes)
    st.dataframe(df)
    # if st.button('select row'):
    users = get_all_values(table)
    value = st.selectbox(f'select {users[1]} to delete',users[0])
    st.warning("Changes Made will be commited")
    col1, col2 = st.columns(2)
    with col1:
        if st.button("delete value"):
            delete_val(value,table,users[1])

    with col2:
        if st.button("delete table"):
            delete_table(table)

    # st.success('Deletion successful')