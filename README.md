# Logging for ML Models

Logging for machine learning models - Precisely for a model predicting insurance charges

This code is used in this [blog post](https://www.tekhnoal.com/logging-for-ml-models.html).

## Requirements

- Python 3.5 or above

## Installation 

The Makefile included with this project contains targets that help to automate several tasks.

To download the source code execute this command:

```bash
git clone https://github.com/felixzhaofelix/logging-for-ml-models
```

Then create a virtual environment and activate it:

```bash
# go into the project directory
cd logging-for-ml-models

make venv

source venv/bin/activate
```

Install the dependencies:

```bash
make dependencies
```
This logging decorator was used by the author of the repository:
```bash
https://github.com/schmidtbri/logging-for-ml-models
```
## Usage
I replaced the credit risk model it was originally used on with the insurance charges model and
to do so I had first open the file:
```bash
logging-for-ml-models/requirements.in
```
and replace the following line:
```bash
-e git+https://github.com/schmidtbri/health-checks-for-ml-model-deployments#egg=credit_risk_model
```
```bash
-e git+https://github.com/felixzhaofelix/regression-model-fixed#egg=insurance_charges_model
```
and run the following command to install the set of dependencies(the ones you install in the previous step):
```bash
pip install pip-tools
pip-compile requirements.in
pip install -r requirements.txt
```
and of course in the rest of the files I replaced the credit risk model with the insurance charges model.



