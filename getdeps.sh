#!/bin/bash
set -e

if [[ -z "$INPUT_CONSOLE_VERSION" ]]; then
  echo "Missing CONSOLE VERSION in the action"
  exit 1
fi

if [[ -z "$INPUT_SCRIPTS_VERSION" ]]; then
  echo "Missing SCRIPTS VERSION in the action"
  exit 1
fi

if [[ -z "$INPUT_SOLSTA_CLIENT_ID" ]]; then
  echo "Missing SOLSTA CLIENT ID in the action"
  exit 1
fi

if [[ -z "$INPUT_SOLSTA_CLIENT_SECRET" ]]; then
  echo "Missing SOLSTA CLIENT SECRET in the action"
  exit 1
fi

cd /github/workspace
# Download the latest deploy scripts
mkdir -p solsta_work
cd solsta_work
rm -f *
wget https://releases.snxd.com/deploy-scripts-$INPUT_SCRIPTS_VERSION.zip
unzip deploy-scripts-$INPUT_SCRIPTS_VERSION.zip
# Generate console credential file from env vars
echo "{\"consoleCredentials\":{\"audience\":\"https://axis.snxd.com/\",\"clientId\":\"$INPUT_SOLSTA_CLIENT_ID\",\"clientSecret\":\"$INPUT_SOLSTA_CLIENT_SECRET\",\"grant\":\"clientCredentials\"}}"  > client_credentials.json
# Install any missing deploy script dependencies
pip install -r requirements.txt
# Download the latest SSN Console Tools if necessary
if [ ! -d "solsta_console/$INPUT_CONSOLE_VERSION" ]; then python3 direct_get.py --overwrite --version="$INPUT_CONSOLE_VERSION" --target_directory=./solsta_console/$INPUT_CONSOLE_VERSION/ --console_credentials=client_credentials.json ; fi
# Run the script that creates a new release and deploys it
cd ..
