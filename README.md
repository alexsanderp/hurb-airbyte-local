# Hurb Airbyte  
  
This repository contains instructions for running airbyte locally for testing connectors. It also contains the CI/CD workflows for deploying airbyte to a production cluster on GKE.
  
## Local development  
  
### Prerequisites  
**To interact with airbyte locally , make sure to complete this prerequisites section.**

#### A linux amd64 environment is required. We may add support for other architectures such as arm64 and MacOS operating system in the future.

#### Install dependencies
Run the following shell script to install the dependencies (minikube, helm and airbyte helm repo):
```
cd scripts/
bash install_local_dependencies.sh
```

### Locally running the airbyte
This script starts minikube, installs airbyte and prints a URL for local access. If minikube and airbyte are already running, just print the url for access:

```
cd scripts/
bash run_local_airbyte.sh
```

### Locally using the custom connector in Airbyte (minikube)  

If you want to test a connector that is already publicly available on dockerhub, skip the step of build and skip the step of load the docker image on minikube.


#### Build  
```
cd YOUR_CONNECTOR_GITHUB_REPO/
docker build -t airbyte/(destination or source)-YOUR_CONNECTOR_NAME:dev .  
```
 
#### Load  

Send your custom connector docker image (local) to minikube:

Example:
```  
minikube image load airbyte/(destination or source)-YOUR_CONNECTOR_NAME:dev 
```  
 
#### Using
Go to airbyte url: http://localhost:8000  
  
Go to Settings > Destinations  
![img.png](images/1.png)  
  
Click in New connector and register the docker image  
![img.png](images/2.png)  
  
Now create a new destination with the connector parameters.
  
Create a pipeline using any source and the new registered destination to test :)