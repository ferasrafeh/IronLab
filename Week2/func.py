import pandas as pd 
import numpy as np

def rename_func(x):
    x.rename(columns = {"GENDER":"gender","ST":"state","Customer Lifetime Value":"customer_lifetime_value",
                       "Number of Open Complaints":"nb_of_open_complaints","Policy Type":"policy_type",
                       "Monthly Premium Auto":"monthly_premium_auto","Vehicle Class":"vehicle_class",
                       "Total Claim Amount":"total_claim_amount"}, inplace=True)
    return x


def low_case(x):
    x.columns = [i.lower() for i in x.columns]
    return x

def clean_gender(x):
    x["gender"] = x["gender"].replace({"Femal":"F","Male":"M","female":"F"})
    return x["gender"]

def clean_state(x):
    x["state"] = x["state"].replace({"Washington":"WA","Arizona":"AZ","California":"Cali","Nevada":"Nev","Oregon":"Org"})
    return x["state"]

def clean_education(x):
    x["education"] = x["education"].replace("Bachelor","Bachelors")
    return x["education"] 


def clean_lifetime_value(x):
    x["customer_lifetime_value"] = x["customer_lifetime_value"].apply(lambda x: x.replace("%","") if type(x)==str else x )
    x["customer_lifetime_value"] = x["customer_lifetime_value"].astype("float64")
    return x["customer_lifetime_value"]

def clean_complaints(x):
    x["nb_of_open_complaints"] = x["nb_of_open_complaints"].apply(lambda x: x.split("/")[1] if type(x)==str else x)
    x["nb_of_open_complaints"] = x["nb_of_open_complaints"].astype("float64")
    return x["nb_of_open_complaints"]

def fill_na_lifetime(x):
    x["customer_lifetime_value"] = x["customer_lifetime_value"].fillna(value=x["customer_lifetime_value"].mean())
    return x["customer_lifetime_value"]

def fill_na_gender(x):
    x["gender"] = x["gender"].fillna(value="F")
    return x["gender"]

def drop_null_customers(x):
    x.dropna(subset=["customer"],inplace=True)   
    return x   

def index_reset(x):
    x.reset_index(drop=True, inplace=True)
    return x
    
def numeric_to_int(x):
   x = x.applymap(lambda x: int(x) if type(x) == float else x)
   return x  

def remove_dups(x):
    x.drop_duplicates(subset = "customer",ignore_index = True, inplace=True)
    return x

def main(x):
    rename_func(x)
    low_case(x)
    clean_gender(x)
    clean_state(x)  
    clean_education(x)
    clean_lifetime_value(x)
    clean_complaints(x)
    drop_null_customers(x)
    fill_na_lifetime(x)
    fill_na_gender(x)
    index_reset(x)
    x = numeric_to_int(x)
    remove_dups(x)
    return x