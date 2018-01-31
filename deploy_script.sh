#!/bin/bash
read -p "Deploy for (local|staging|prod) : " enviro

if [ $enviro == "l" ]; then
  enviro="local"
elif [ $enviro == "s" ]; then
  enviro="staging"
elif [ $enviro == "p" ]; then
  enviro="prod"
fi
browsertoremove="firefox"
read -p "Deploy for (firefox(f)|chrome(c)) : " browser

if [ $browser == "f" ] || [ $browser == "firefox" ]; then
  browser="firefox"
  browsertoremove="chrome"
elif [ $browser == "c" ] || [ $browser == "chrome" ]; then
  browser="chrome"
else
  browser="chrome"
fi
destdir="varanida_${enviro}_${browser}"

# copy template to destination
cp -R extension-template/ $destdir
rm $destdir/.DS_Store
rm $destdir/assets/.DS_Store
rm $destdir/assets/images/.DS_Store

# load config file
if [ $enviro == "local" ]; then
  source local_config.txt
elif [ $enviro == "staging" ]; then
  source staging_config.txt
elif [ $enviro == "prod" ]; then
  source prod_config.txt
else
  echo "no mode selected"
  exit 1
fi

manifest_scope="${manifest_scope//\//\\/}"
api_url="${api_url//\//\\/}"
front_url="${front_url//\//\\/}"

#remove browser specific code
sed -i '' "/\/\/__compiler_start:${browsertoremove}/,/__compiler_end/d" $destdir/manifest.json
sed -i '' "/\/\/__compiler_start:${browser}/d" $destdir/manifest.json
sed -i '' "/\/\/__compiler_end/d" $destdir/manifest.json

# replace generic expressions
# sed -i '' "s/__manifest_scope/${manifest_scope}/g" $destdir/manifest.json
