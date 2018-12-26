#!/bin/bash

git mv packages/core/src/config/AeroGearConfiguration.ts packages/core/src/config/AeroBaseConfiguration.ts

find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's/AeroGear/AeroBase/g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's/Aerogear/Aerobase/g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|\/cordova-showcase-template|-demo\/angular-oauth2-starter|g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's/Cordova Showcase/Demo/g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's/Showcase/Demo/g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's/showcase/demo/g'

# JIRA Related
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|issues.jboss.org|aerobase.atlassian.net|g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|AEROGEAR|AEROBASE|g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|AGJS|AEROBASE|g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|AGCORDOVA|AEROBASE|g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|aerogear.org\/docs\/guides\/JIRAUsage|aerobase.atlassian.net|g'

find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|1116366.n5.nabble.com|62586.n8.nabble.com|g'
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|JBoss Developer JIRA|Aerobase Developer JIRA|g'

# Set KC Version 4.0.0-beta.1
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|4.0.0-beta.1|4.8.1|g'

# Improve bootstrap commands
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's|==== Run tests with coverage|==== Bootstrap submodules\n[source,bash]\nnpm run bootstrap\n\n==== Run tests with coverage|g'

# Must me last replacement 
find . -type f ! -name "*aerobase-lable.sh" ! -name ".git*" -print0 | xargs -0 sed -i 's/aerogear.org/aerobase.io/g'
find . -type f ! -name "*MetricsService.ts" ! -name ".git*" ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's/aerogear/aerobase/g'
find .circleci -type f -print0 | xargs -0 sed -i 's/aerogear/aerobase/g'

rm -rf docs/modules

echo "successfully relabel aerobase to aerobase"
