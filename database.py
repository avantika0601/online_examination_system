# pip install mysql-connector-python
import mysql.connector
import streamlit as st

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="online_exam_system"
)
c = mydb.cursor()


#def create_table():
#    c.execute("CREATE TABLE CANDIDATE(user_id INT NOT NULL,user_name varchar(50)NOT NULL,First_Name varchar(50)NOT NULL,Last_name varchar(50),college_organisation_name varchar(50)NOT NULL,email_id varchar(20),phone_no varchar(50),PRIMARY KEY(user_id));")
    


def add_data(table,new_val):
    new_val = tuple(new_val)
    tot_values = '%s,'*len(new_val)
    tot_values = tot_values[:-1]
    c.execute(f"INSERT INTO {table} VALUES ({tot_values})",new_val)
    mydb.commit()


def view_all_data():
    c.execute('SELECT * FROM candidate')
    data = c.fetchall()
    return data


def view_only_candidate_names():
    c.execute('SELECT First_name FROM candidate')
    data = c.fetchall()
    return data


def get_candidate(candidate):
    c.execute('SELECT * FROM candidate WHERE First_name="{}"'.format(candidate))
    data = c.fetchall()
    return data


def edit_candidate_data(new_user_id,new_user_name,new_First_name,new_Last_name,new_college_organisation_name,new_email_id,new_phone_no, user_id,user_name,First_name,Last_name,college_organisation_name,email_id,phone_no):
    c.execute("UPDATE candidate SET user_id=%s, user_name=%s, First_name=%s, Last_name=%s, college_organisation_name=%s,email_id=%s,phone_no=%s WHERE user_id=%s and user_name=%s and First_name=%s and Last_name=%s and college_organisation_name=%s and email_id=%s and phone_no=%s", (new_user_id, new_user_name, new_First_name, new_Last_name, new_college_organisation_name,new_email_id,new_phone_no, user_id,user_name,First_name,Last_name,college_organisation_name,email_id,phone_no))
    mydb.commit()
    # data = c.fetchall()
    # return data


def delete_data(user_name):
    c.execute('DELETE FROM candidate WHERE user_name="{}"'.format(user_name))
    mydb.commit()


def execute_query(query):
    try:
        c.execute(query)
        if query.split()[0].lower() not in ['select','show']:
            mydb.commit()
        data = c.fetchall()
        return [data,c.column_names]
    except BaseException as e:
        if str(e)=='No result set to fetch from.':
            st.success('querry successful')
            return 1
        st.error(e)
        return 0
# alter  select * from table
# update select * from table
# delete show tables
# create show tables

def show_tables():
    c.execute('show tables')
    res = c.fetchall()
    tables = [i[0]  for i in res ]
    return tables

def get_attributes(table):
    c.execute(f'select * from {table}')
    res = c.fetchall()
    attributes = c.column_names
    return attributes

def view_table(table):
    c.execute(f'select * from {table}')
    res = c.fetchall()
    return res

def get_all_values(table):
    c.execute(f"show keys from {table} where key_name = 'primary'")
    res = c.fetchall()
    P_key = res[0][4]
    c.execute(f"select {P_key} from {table} ")
    attri_list = c.fetchall()
    attri_list = [i[0] for i in attri_list]
    return [sorted(attri_list),P_key]

def delete_val(value,table,attribute):
    try:
        # que to get datatype if needed select data_type from information_schema.columns where table_name = 'ticket' and column_name = 'pnr'
        c.execute(f"delete from {table} where {attribute}='{value}'")
        mydb.commit()
        st.success("Deletion successful")
    except Exception as e:
        st.error(e)

def delete_table(table):
    try:
        c.execute(f"drop table {table}")
        mydb.commit()
        st.success("Deletion successful")
    except Exception as e:
        st.error(e)

