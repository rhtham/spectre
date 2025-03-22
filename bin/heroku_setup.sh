#!/bin/bash

echo "Setting up Heroku deployment environment..."

# Check and pin the Node.js version
echo "==> Setting up Node.js version"
if [ ! -f "package.json" ]; then
  echo "{\"name\":\"spectre\",\"private\":true,\"engines\":{\"node\":\"22.x\"}}" > package.json
  echo "Created package.json with Node.js 22.x"
else
  echo "package.json already exists"
fi

# Set Heroku build packs
echo "==> Configuring Heroku buildpacks"
heroku buildpacks:clear
heroku buildpacks:add heroku/nodejs
heroku buildpacks:add heroku/ruby

echo "Setup complete! Run 'git add . && git commit -m \"Heroku deployment config\" && git push heroku main' to deploy."
