#!/bin/bash

git mv packages/core/src/config/AeroGearConfiguration.ts packages/core/src/config/AeroBaseConfiguration.ts

find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's/AeroGear/AeroBase/g'
find . -type f ! -name "*MetricsService.ts" ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's/aerogear/aerobase/g'

# Replace broken links - This might change over time when upstraem change

find . -type f ! -name "*aerobase-lable.sh"  -print0 | xargs -0 sed -i 's|issues.jboss.org/browse/AGCORDOVA|aerobase.atlassian.net/projects/ARBCORD/issues/|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|1116366.n5.nabble.com|62586.n8.nabble.com|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|(./docs/getting-started.adoc)|(./docs/modules/getting-started/pages/getting-started.adoc)|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|(./docs/getting-started.adoc)|(./docs/modules/getting-started/pages/auth.adoc)|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|(./docs/metrics/metrics.adoc)|(./docs/modules/getting-started/pages/metrics.adoc)|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|(./docs/security/security.adoc)|(./docs/modules/getting-started/pages/security.adoc)|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|https://issues.jboss.org/browse/AGJS|https://aerobase.atlassian.net/projects/ARBJS/issues/|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|https://issues.jboss.org/projects/AGJS/issues|https://aerobase.atlassian.net/projects/ARBJS/issues/|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|JBoss Developer JIRA|Aerobase Developer JIRA|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|https://aerobase.org/docs/guides/JIRAUsage/|https://aerobase.org/docs/|g'
find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's|(./docs/releng.adoc)|(./docs/contrib/releng.adoc)|g'

echo "successfully relabel aerobase to aerobase"
