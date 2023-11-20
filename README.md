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

[Visit regression-model-fixed](https://github.com/felixzhaofelix/regression-model-fixed/blob/master/README.md)


```bash
logging-for-ml-models/blog_post/README_regression-model.md
```
Make sure the service can run with successful health checks on Docker and then we'll be ready for the next step

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

This logging decorator was used by the author of [this repository](https://github.com/schmidtbri/logging-for-ml-models)

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
[Or this link](https://github.com/uqam-lomagnin/logging-of-regression-model-felixzhaofelix/blob/main/blog_post/blog_post.ipynb)

#### Integrating the logging decorator:
The following steps are described in the blog_post.ipynb file:

Up until this cell nothing has been modified:
```ipynb
!pip install -e git+https://github.com/felixzhaofelix/regression-model-fixed#egg=insurance_charges_model
```
and here:
```ipynb
from insurance_charges_model.prediction.model import InsuranceChargesModel
```
and here:
```ipynb
from insurance_charges_model.prediction.schemas import InsuranceChargesModelInput

model_input = InsuranceChargesModelInput(
    age = 65,
    sex = "male",
    bmi = 50,
    children = 5,
    smoker = True,
    region = "northeast"
)
```
and other critical parts of the code that are not shown in the README.md file

### After making the integrated service run locally, we are gonna deploy it on Docker:

I had to change the base image template from python3.9-slim to tiangolo/uvicorn-gunicorn-fastapi:python3.9
because the former was not compatible with the new packages


![External Image](images/tiangolo.png)
-But then I had to change the base image template back to python3.9-slim because that template was recommanded against by the author for Kubernetes deployment.-


![Externel Image](images/docker_image_arm64.png)
-Instead of using the default platform, we have specify the platform to be ARM64 for M1 Macs and later

![External Image](images/model_docker_image.png)
-Here's the image of the model running on Docker-

![External Image](images/model_docker_container.png)
-Here's the container of the image running on Docker-

![External Image](images/service_client_page.png)
-Here's the client page of the service running on Docker-

![External Image](images/sample_request1.png)
-Here's a sample request-

![External Image](images/sample_request2.png)
-Here's another sample request-

![External Image](images/sample_service_log.png)
-Here's the log of the service-

### Pending deployment of the service on Kubernetes

Up until this date I have not been able to deploy the service on Kubernetes, I have tried the following:

-Using the default base image template tiangolo/uvicorn-gunicorn-fastapi:python3.9

-Using the base image template python3.9-slim

-Generating a Docker image for ARM64 platform with Docker Buildx

-Generating a Docker image for multi-platform

-Allocating more memory to miniKube (6122MB and 8192MB) 

-Reconfirm repeatedly every relevant file in the deployment process

Sadly none of these attempts were successful, I will keep trying and update this README.md file when I have a solution.

### Integrating 

## Final Note
Outcomes of my modifications as Nov 2023 for the project "logging-of-regression-model-felixzhaofelix"

-Successful retraining of insurance-charges-model with R2 value of 0.91

-Successful local and Docker deployment of insurance-charges-model

-Successful integration of logging-of-ml-model to insurance-charges-model

-Successful local and Docker deployment of logging-of-regression-model

-Successful generation of Docker image for ARM64 platform

-Pending deployment of logging-of-regression-model on Kubernetes




