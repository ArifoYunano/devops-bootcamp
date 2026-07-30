Secrets vs. Variables

1. Secrets

What they are: Encrypted, highly sensitive pieces of information stored securely in repository or organization settings.

Role: Masked in logs (displayed as ***) so they are never exposed in plain text to developers or build outputs.

Common Examples:

API tokens (e.g., GitHub Personal Access Tokens, AWS Access Keys)

Database passwords and private SSH keys

Deployment API keys (e.g., Vercel, Netlify, Docker Hub passwords)

Goal: Protect confidential data from being exposed in public code repositories, build logs, or unauthorized access.

2. Variables (Environment Variables)

What they are: Non-sensitive configuration parameters stored in plain text.

Role: Readily visible in build logs and accessible throughout the workflow jobs for runtime configuration.

Common Examples:

Application environments (e.g., NODE_ENV=production, STAGE=staging)

Non-sensitive URLs (e.g., API_BASE_URL=[https://api.example.com](https://api.example.com))

App configuration flags (e.g., PORT=8080, FEATURE_FLAG_X=true)

Goal: Keep configuration settings separate from application code, making it easy to switch environments without changing code files.

How They Work Together in a Workflow

Inside workflow or .yaml file, you reference both secrets and variables to build and deploy application safely:

Job Execution:
  1. Fetch non-sensitive config  ---> [VARIABLE: API_URL]
  2. Fetch secure credentials   ---> [SECRET: DB_PASSWORD]
  3. Deploy application safely using both values

YAML
# Example usage in GitHub Actions
env:
  ENVIRONMENT: ${{ vars.NODE_ENV }}         # Plain text Variable
  DATABASE_PASS: ${{ secrets.DB_PASSWORD }} # Masked Secret
