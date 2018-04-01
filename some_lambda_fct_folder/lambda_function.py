import pandas as pd

def lambda_handler(event, context):
    df = pd.DataFrame({'sunshine': 'reggea'}, index=[0])
    print(df)
