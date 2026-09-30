#!/bin/sh
#
# Gradle start up script for POSIX generated for Nova Gallery
# Automatically invokes installed gradle or gradle/actions/setup-gradle in CI
#

if command -v gradle >/dev/null 2>&1; then
    exec gradle "$@"
else
    echo "Gradle CLI not found on PATH. In GitHub Actions, gradle/actions/setup-gradle@v4 provisions Gradle 8.7 automatically."
    exit 1
fi
