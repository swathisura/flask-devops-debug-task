# Flask DevOps Debug Task (Harbor Framework)

##  Overview

This project demonstrates a DevOps-focused debugging task implemented using the Harbor (Terminal Bench 2.0) framework. The task simulates a real-world production issue where a containerized Flask application fails to start due to dependency conflicts.

The purpose of this task is to evaluate problem-solving ability in debugging, dependency management, and working with Docker-based environments.

---

## Objective

The main objective of this task is to:

* Identify why the Flask application is failing inside a Docker container
* Fix the issue without modifying test logic
* Ensure the application runs successfully and returns the expected response


##  Problem Description

The provided Flask application is intentionally misconfigured with incompatible dependency versions:

* `flask==2.0.1`
* `werkzeug==3.0.0`

These versions are not compatible with each other, which causes runtime errors when the application starts inside the container.

This simulates a common real-world issue where applications break after dependency upgrades or incorrect version pinning.


##  Environment Details

* Python runtime: 3.12
* Containerized using Docker
* Application runs inside `/app/` directory in the container
* Dependencies are installed via `requirements.txt`


## 🛠️ Solution Approach

To fix the issue, the dependency versions were updated to compatible versions:

* `flask==2.2.5`
* `werkzeug==2.2.3`

These versions are stable and work correctly together.

The fix is implemented in:


solution/solve.sh

This script updates the dependency file so that the application can run successfully.

##  Project Structure

flask-devops-debug-task/
│
├── task.toml              # Task configuration for Harbor
├── instruction.md         # Instructions for the AI agent
│
├── environment/           # Application environment
│   ├── Dockerfile         # Container setup
│   ├── app.py             # Flask application
│   └── requirements.txt   # Dependencies (intentionally broken)
│
├── solution/              # Golden solution
│   └── solve.sh           # Fixes dependency issue
│
└── tests/                 # Validation tests
    └── test_outputs.py    # Functional test cases


##  Execution Flow

### 1. Task Initialization

The Harbor framework loads the task configuration and prepares the environment.

### 2. Docker Build

* Docker image is built using the provided Dockerfile
* Application files are copied into `/app/`
* Dependencies are installed

### 3. Failure Scenario

* The application fails due to incompatible dependency versions
* This reflects a real-world deployment issue

### 4. Solution Execution

* The `solve.sh` script modifies the dependency versions
* The environment is updated accordingly

### 5. Validation

* Tests are executed to verify the fix
* The application must respond correctly to pass

##  How to Run

Run the following command from the parent directory:


harbor run -p ./flask-devops-debug-task -a oracle

This will:

* Build the Docker environment
* Execute the solution
* Run the test cases

## Expected Output

After successful execution:

* Docker container builds without errors
* Flask application starts on port `5000`
* API endpoint `/` responds correctly

### Sample Response:

HTTP 200 OK
Hello DevOps

## Test Validation

The test suite verifies:

* The application is reachable
* HTTP status code is `200`
* Response body contains `"Hello DevOps"`

If all conditions are met, the task passes successfully.


##  Key Learnings

This task highlights important DevOps concepts:

* Debugging dependency conflicts
* Managing Python package versions
* Working with Docker containers
* Understanding runtime failures in production
* Writing and validating automated tests

##  Notes

* The solution is hidden from the AI agent
* Tests are not exposed inside the environment
* The task requires reasoning, not simple file inspection
* The issue cannot be solved by just reading files; debugging is required


## Conclusion

This task provides a practical scenario where a developer or AI agent must diagnose and fix a broken application in a containerized environment.

It reflects real-world DevOps challenges involving dependency management, debugging failures, and ensuring application reliability through testing.
