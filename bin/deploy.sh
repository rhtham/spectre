#!/bin/bash
set -e

echo "Running yarn build..."
yarn build

echo "Precompiling assets with jsbundling..."
bin/rails assets:precompile

echo "Ready for deployment!"
