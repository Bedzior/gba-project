#!/bin/bash

set -e

for i in "$@"; do
case $i in
    -c=*|--buildConfig=*)
    BuildConfig="${i#*=}"
    shift # past argument=value
    ;;
esac
done

if [ -z "$BuildConfig" ]; then
    echo "Missing -c|--buildConfig parameter"
    exit 1
fi

if [ -e ./scripts/variables.sh ]; then
    . ./scripts/variables.sh
else
    print "Script is not run from root directory" >&2
    exit 1
fi

cmake \
    -G "Unix Makefiles" \
    -B "$BUILD" \
    -S "$ROOT" \
    -DCMAKE_BUILD_CONFIG="$BuildConfig" \
    -DCMAKE_INSTALL_PREFIX="$INSTALL"

cmake \
    --build "$BUILD" \
    --config "$BuildConfig" \
    --target game.gba \
    --parallel "$(nproc)"
