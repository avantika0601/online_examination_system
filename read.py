import pandas as pd
import streamlit as st
import plotly.express as px
from database import view_all_data,show_tables,view_table,get_attributes

# two ways     expander or select 
#ticket and test were not working .....becuase of duration ig
def read():
    tables_list = show_tables()
    table = st.selectbox("Select table", tables_list)
    result = view_table(table)
    attributes = get_attributes(table)
    if st.button("view table"):
        df = pd.DataFrame(result, columns=attributes)
        st.dataframe(df)
    # with st.expander("View all Dealers"):
    #     st.dataframe(df)
    # with st.expander("Dealer Location"):
    #     task_df = df['Dealer City'].value_counts().to_frame()
    #     task_df = task_df.reset_index()
    #     st.dataframe(task_df)
    #     p1 = px.pie(task_df, names='index', values='Dealer City')
    #     st.plotly_chart(p1)