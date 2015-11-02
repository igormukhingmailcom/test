#!/bin/sh

VERSION=${1}
ENV_NAME=${2:-"production"}
CONFIG="shippable.igormukhin.test.master"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

FAIL="${RED}\n
________________  .___.____
\_   _____/  _  \ |   |    |
 |    __)/  /_\  \|   |    |
 |     \/    |    \   |    |___
 \___  /\____|__  /___|_______ \\
     \/         \/            \/
${NC}";

SUCCESS="${GREEN}\n
  _____________ ____________ _________ ___________ _________ _________
 /   _____/    |   \_   ___ \\\\_   ___ \\_   _____//   _____//   _____/
 \_____  \|    |   /    \  \//    \  \/ |    __)_ \_____  \ \_____  \\
 /        \    |  /\     \___\     \____|        \/        \/        \\
/_______  /______/  \______  /\______  /_______  /_______  /_______  /
        \/                 \/        \/        \/        \/        \/
${NC}";

if [ ! -f ~/.aws/config ]; then
    aws configure
fi

echo "Start deploying $VERSION version to $ENV_NAME AWS EB environment...\n"

aws elasticbeanstalk update-environment --environment-name "$ENV_NAME" --version-label "$CONFIG.$VERSION"

if [ $? -eq 0 ]; then
    echo "$SUCCESS"
else
    echo "$FAIL"
fi
