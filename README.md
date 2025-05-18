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

## Setting Up the CI/CD Pipeline
**1. Clone the Repository**
```bash
git clone https://github.com/weizhe-sha/webapp-cicd-pipeline.git
cd webapp-cicd-pipeline
```
**2. Create a new branch**
It's best practice to create a new branch for your changes
```bash
git checkout -b feature/your-feature-name
```
Replace `feature/your-feature-name` with a descriptive name for your branch
**3. Make your changes**
Edit, add, or delete files as needed using your preferred code editor.
**4. Stage and commit your changes**
After making changes, stage and commit them:
```bash
git add .
git commit -m "Add a descriptive commit message"
```
**5. Push your branch to GitHub**
Push your new branch to your GitHub repository:
```bash
git push origin feature/your-feature-name
```
**6. Create a pull request**
1. Navigate to your repository on GitHub.
2. Click the Compare & pull request button next to your recently pushed branch.
3. Ensure the base repository and branch (e.g., main) are correct.
4. Add a title and description for your pull request, detailing the changes and any relevant information.
5. Click Create pull request to submit.
**7. Run pipeline
The pipeline will be triggered when commits are pushed to the `main` branch