CI & CD Core Principle: CI manages the code, CD delivers the code.

Continuous Integration (CI) Main Function: Every time code is merged, it is tested and built automatically.
Goal: CI ensures code health (maintains quality and prevents bugs/errors before deployment).

Continuous Delivery (CD) Main Function: Code is always ready for release, allowing deployment to production at the click of a button.
Goal: CD delivers the code (ensures smooth and fast code deployment to end-users).

Key Components in GitHub Actions & Web Hosting

1. .yaml File What it is: A structured text file written in YAML format (usually located in .github/workflows/ in repository).
Role: Acts as the blueprint or configuration file that tells GitHub Actions what automation rules to follow, when to run them, and what environment to set up.

2. Workflow What it is: An automated process defined inside .yaml file.
Role: Triggered by specific events (e.g., pushing code to main, opening a pull request, or running on a schedule). It encompasses the entire CI/CD pipeline from start to finish.

3. Job What it is: A set of steps executed sequentially on a specific runner (virtual environment/server, like Ubuntu or Windows).
Role: A workflow is made up of one or more jobs (e.g., a build job, a test job, and a deploy job). By default, multiple jobs run in parallel, but they can be configured to run sequentially if one depends on another.

4. URL / Web Pages (GitHub Pages) What it is: The live web address where compiled/built site is published and accessible to users.
Role: The final destination of a deployment pipeline. Once job finishes building and pushing the static assets, GitHub Pages hosts them and provides a public URL (e.g., https://username.github.io/repository-name).

[.yaml File] ---> Triggers a [Workflow] ---> Executes [Job(s)] ---> Deploys to live [URL Page] (Configuration) (Event: Push/Merge) (Build, Test, Deploy) (Publicly Hosted Website)

Write a .yaml file defining on build and deployment instructions.

A code push triggers the workflow.

The workflow runs a job that builds site's code and deploys the generated output.

The site becomes publicly accessible on live URL page.
