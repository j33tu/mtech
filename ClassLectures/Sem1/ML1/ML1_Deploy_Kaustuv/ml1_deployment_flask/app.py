# -*- coding: utf-8 -*-
"""
Created on 6 July 2023
@author: kaustuv Kunal

"""

import joblib
import pandas as pd
from flask import Flask, render_template, request

app = Flask(__name__)
loaded_model = joblib.load('full_pipeline.pkl')

@app.route("/")
def root():
    return render_template("index.html")


@app.route("/predict", methods=['POST'])
def make_prediction():

    if request.method == 'POST':

        married = request.form['Married']
        education = request.form['Education']
        applicant_income = request.form['ApplicantIncome']
        loan_amount = request.form['LoanAmount']
        credit_history = request.form['Credit_History']

        data = {'Married': [married],
                'Education': [education],
                'ApplicantIncome': [applicant_income],
                'LoanAmount': [loan_amount],
                'Credit_History': [credit_history]}
        df = pd.DataFrame(data)

        df = df.astype({'Married': object,
                        'Education': object,
                        'ApplicantIncome': 'Int64',
                        'LoanAmount': 'Int64',
                        'Credit_History': 'Int64',
                        })


        prediction = loaded_model.predict(df)[0]
        status = int(prediction *100)
    msg = " Loan sanction probability is " + str(status) + " %  "

    return render_template("index.html", prediction_text= msg)


if __name__ == '__main__':
    app.run(debug=True, port = "60001")
