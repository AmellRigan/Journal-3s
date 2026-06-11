#!/usr/bin/env sh

##############################################################################
# Gradle wrapper script for UN*X systems.
#
# Priority order:
#   1. Use gradle-wrapper.jar if present and java available
#   2. Fall back to `gradle` on PATH  (set by gradle/actions/setup-gradle)
##############################################################################

set -e

# Resolve APP_HOME
PRG="$0"
while [ -h "$PRG" ]; do
    ls_out=$(ls -ld "$PRG")
    link=$(expr "$ls_out" : '.*-> \(.*\)$')
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG="$(dirname "$PRG")/$link"
    fi
done
APP_HOME="$(cd "$(dirname "$PRG")" && pwd -P)"

WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
WRAPPER_PROPS="$APP_HOME/gradle/wrapper/gradle-wrapper.properties"

# Java executable
if [ -n "$JAVA_HOME" ]; then
    JAVA="$JAVA_HOME/bin/java"
else
    JAVA="java"
fi

# Try the real wrapper jar first
if [ -f "$WRAPPER_JAR" ]; then
    # Test if the jar actually contains GradleWrapperMain
    if "$JAVA" -cp "$WRAPPER_JAR" org.gradle.wrapper.GradleWrapperMain --version > /dev/null 2>&1; then
        exec "$JAVA" \
            -classpath "$WRAPPER_JAR" \
            org.gradle.wrapper.GradleWrapperMain \
            "$@"
    fi
fi

# Fallback: gradle must be on PATH (provided by gradle/actions/setup-gradle in CI)
if command -v gradle > /dev/null 2>&1; then
    exec gradle "$@"
fi

echo >&2 "ERROR: Cannot find Gradle."
echo >&2 "  - gradle-wrapper.jar is missing or incomplete, and"
echo >&2 "  - 'gradle' is not on PATH."
echo >&2 ""
echo >&2 "On GitHub Actions this is solved by adding:"
echo >&2 "  uses: gradle/actions/setup-gradle@v3"
exit 1
