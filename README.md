# Logging of Regression Model for Insurance Charges

Logging for machine learning models - Precisely for a model predicting insurance charges

## Requirements

- Python 3.9 or above (I used 3.9.6)

## Installation 

The Makefile included with this project contains targets that help to automate several tasks.

### Theres two part to this installation:
Start with part 2 first, if all is installed then skip part, if not the insurance charges model's installation is unsuccessful, come back and follow steps in part 1 
#### Part 1: Requirements for the regression model (insurance charges model)
Here's what i did:
This part requires its own dependency management, first to download it:

```bash
git clone https://github.com/felixzhaofelix/regression-models-fixed
```
And follow the instructions on its README.md, here's  a copy of it:
```bash
blog_post/README_regression_model.md
```

```bash
logging-for-ml-models/blog_post/README_regression-model.md
```
Make sure the service can run with successful probes on Docker and then we'll be ready for the next step

#### Part 2: Requirements for the logging decorator

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

To install the dependencies:

I replaced the credit risk model that was originally used on with the insurance charges model and
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
and run the following commands to generate the requirements.txt file
```bash
pip install pip-tools
pip-compile requirements.in
```
and run the following command to install the set of dependencies(for regression model and for the logging decorator):
```bash
make dependencies
```

This logging decorator was used by the author of the repository:
```bash
https://github.com/schmidtbri/logging-for-ml-models
```
and in the rest of the YAML files I replaced occurrences of credit risk model with insurance charges model.
here are the modified YAML files:
```bash
configuration/kubernetes_rest_config.yaml
configuration/rest_configuration.yaml
kubernetes/model_service.yaml
```

We are now ready to tackle the ->
## -> Integration of the logging decorator to insurance charges model

Modifications to make this part run is described in this file:
```bash
logging-for-ml-models/blogpost/blog_post.ipynb
```

## Final Note
Outcomes of my modifications as Nov 2023 for the project "logging-of-regression-model-felixzhaofelix"
-Successful retraining of insurance-charges-model with R2 value of 0.91
-Successful local and Docker deployment of insurance-charges-model
-Successful integration of logging-of-ml-model to insurance-charges-model
-Successful local and Docker deployment of logging-of-regression-model
-Successful generation of Docker image for ARM64 platform
-Pending deployment of logging-of-regression-model on Kubernetes




