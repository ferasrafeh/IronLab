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
    if x["gender"].any() in ["Femal","female","F"]:
        x["gender"] == "F"
    elif x["gender"].any() in ["Male","M"]:
        x["gender"] == "M"
    else:
         x["gender"] == np.nan
    
    return x["gender"]
    

def clean_state(x):
    if x["state"].any() in ["Washington","WA"]:
        return "WA"
    
    elif x["state"].any() in ["Arizona","AZ"]:
        return "AZ"
    elif x["state"].any() in ["California","Cali"]:
        return "Cali"
    elif x["state"].any() == "Nevada":
        return "Nev"
    else:
        return "Org"
    
def clean_education(x):
    if x["education"].any() in ["Bachelors","Bachelor"]:
        return "Bachelors"
    else:
        return x["education"] 


def clean_lifetime_value(x):
    x["customer_lifetime_value"] = x["customer_lifetime_value"].str.replace("%","")
    x["customer_lifetime_value"] = x["customer_lifetime_value"].astype("float64")
    return x["customer_lifetime_value"]

def clean_complaints(x):
    x["nb_of_open_complaints"] = x["nb_of_open_complaints"].str[2]
    x["nb_of_open_complaints"] = x["nb_of_open_complaints"].astype("float64")
    return x["nb_of_open_complaints"]

def drop_null_customers(x):
    x = x.dropna(subset="customer")
    return x

def fill_na_lifetime(x):
    x["customer_lifetime_value"] = x["customer_lifetime_value"].fillna(value=x["customer_lifetime_value"].mean())
    return x["customer_lifetime_value"]

def fill_na_gender(x):
    x["gender"] = x["gender"].fillna(value=x["gender"].mode())
    return x["gender"]

def index_reset(x):
    x = x.reset_index(drop=True)
    return x

def numeric_to_int(x):
    x= x.dropna()
    x = x.applymap(lambda x: int(x) if isinstance(x,(float)) else x)
    return x

def remove_dups(x):
    x = x.drop_duplicates(ignore_index = True)
    x = x.drop_duplicates(subset = "customer",ignore_index = True)
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
    numeric_to_int(x)
    remove_dups(x)
    return x