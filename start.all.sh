#!/bin/bash
set -a

## this script works on Linux, so it may also work on Mac/OS (Unix)
### this script will not work on windows
#### This script will target root of both projects and execute FE and BE as seperate proces in new terminal


###
export NVM_DIR="$HOME/.nvm"


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
source ~/.bashrc

FORCE_COLOR=1
BACKEND_DIR=./FirebaseNodeJS/functions



### make sure using correct yarn version
nvm use 18.18
corepack enable
corepack yarn@3.5.0
nvm current

##npm i yarn -g


## Execute FE project
echo '<< Execute FE project >>'

## start FE project with local environment
yarn start:local&



## Execute BE project
echo '<< Execute BE project >>'

./node_modules/.bin/delay 1
## navigate to backend project
cd ../koges-kost-koncept-backend

## this will start the backend script to initialize backend with database
gnome-terminal -- bash -c 'bash start.database.sh'

set +a
