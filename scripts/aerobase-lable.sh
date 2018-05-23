#!/bin/bash

cd ../
git mv packages/core/src/config/AeroGearConfiguration.ts packages/core/src/config/AeroBaseConfiguration.ts

find . -type f ! -name "*aerobase-lable.sh" -print0 | xargs -0 sed -i 's/AeroGear/AeroBase/g'
find . -type f ! -name "*MetricsService.ts" -print0 | xargs -0 sed -i 's/aerobase/aerobase/g'

echo "successfully relabel aerobase to aerobase"
