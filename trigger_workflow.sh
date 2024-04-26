#!/bin/bash
 
REPO_OWNER="anilmadala"
REPO_NAME="environment-configuration"
QS_WORKFLOW_NAME="QS.yml"
TEST_WORKFLOW_NAME="TestEnv.yml"
#ENVIRONMENT ="$ENVIRONMENT"
echo "Selected Envronment is: $ENVIRONMENT"

if [ "$ENVIRONMENT" = 'QS' ]; then
echo "Running tests on QS Environment"
curl -X POST \
  -u "${REPO_OWNER}:${TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/workflows/${QS_WORKFLOW_NAME}/dispatches" \
  -d '{"ref":"main"}'
  elif [ $ENVIRONMENT = 'Test' ]; then
  echo "Running tests on Staging Environment"
  curl -X POST \
  -u "${REPO_OWNER}:${TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/workflows/${TEST_WORKFLOW_NAME}/dispatches" \
  -d '{"ref":"main"}'
  else 
  echo "Unspecified Environment : $ENVIRONMENT"
  exit 1
  fi
