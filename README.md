# DevOps CI/CD Task

## Objective
Build a CI/CD pipeline that lints, tests, builds a Docker image, pushes it to a container registry, and deploys it to a live environment.

## App
- A simple Flask app is provided in `app/`
- The `/healthz` endpoint should return 200 and is used for testing

## Test
- Your pipeline must run `tests/test_app.py` and block deployment if it fails

## Bonus
- Add security scanning, deployment notifications, or infra-as-code setup

## Interview
- You may be given a modified version of the app to validate pipeline robustness

---
## Setting Up the Infrastructure 
### 1. Create a resource group for storage account that stores terraform state files
### 2. Create a storage account in the resource group and create a container blob in the storage account
### 3. Paste subscription id and names of resource group, storage account and container created in previous steps to `infra/provider.tf`
### 4. Create a resource group for Azure Service Plan and Web App 
### 5. Paste resource group id, name and location to `infra/main.tf`
### 6. Insert value for asp and webapp name in `infra/main.tf`

## Setting Up the CI/CD Pipeline
### 1. Clone the Repository
```bash
git clone https://github.com/weizhe-sha/webapp-cicd-pipeline.git
cd webapp-cicd-pipeline
```

### 2. Create a new branch
It's best practice to create a new branch for your changes
```bash
git checkout -b feature/your-feature-name
```
Replace `feature/your-feature-name` with a descriptive name for your branch

### 3. Make your changes
Edit, add, or delete files as needed using your preferred code editor.

### 4. Stage and commit your changes
After making changes, stage and commit them:
```bash
git add .
git commit -m "Add a descriptive commit message"
```

### 5. Push your branch to GitHub
Push your new branch to your GitHub repository:
```bash
git push origin feature/your-feature-name
```

### 6. Create a pull request
1. Navigate to your repository on GitHub.
2. Click the Compare & pull request button next to your recently pushed branch.
3. Ensure the base repository and branch (e.g., main) are correct.
4. Add a title and description for your pull request, detailing the changes and any relevant information.
5. Click Create pull request to submit.

### 7. Run pipeline
The pipeline will be triggered when commits are pushed to the `main` branch

---

## Pipeline Workflow
### Job1: lint
Install dependencies and analyse the code with pylint

### Job2: build-push-test-scan (if preceding job succeeds)
1. Log into GitHub Container Registry
2. Extract metadata for Docker
3. Build and push Docker image to GitHub Container Registry
4. Run Docker container and install pytest to run test cases
5. Run Trivy vulnerability scanner and upload results to GitHub Security tab

### Job 3: deploy (if preceding job succeeds)
1. Log into GitHub Container Registry
2. Extract image for Docker
3. Deploy image to Azure WebApp

---

## How to Test and Access the Deployment
### Testing the Application
#### 1. Run Automated Tests Locally
Ensure all tests pass before deployment:
```bash
pytest
```
#### 2. Manual Testing
- Build Docker image:
```bash
docker build . -t <image_name>:<tag>
```
Replace `<image_name>:<tag>` with a descriptive name and tag for your image
- Run Docker container locally:
```bash
docker run -p 5001:5000 -d <image_name>:<tag>
```
Replace `<image_name>:<tag>` with your name and tag set in the step above
- Access the application in your browser at:
```arduino
http://localhost:5001
```
- Verify the following endpoints:
    - **Home Page**: / should return "Hello, world!"
    - **Health Check**: /healthz should return "OK"

### Accessing the Deployed Application
Upon successful completion of pipeline, you can access the application at:
```arduino
https://proa-webapp.azurewebsites.net
```
- Verify the deployment:
    - **Home Page**: / should return "Hello, world!"
    - **Health Check**: /healthz should return "OK"