#!/bin/bash

# Constants
ZIP_NAME="UserExperiorSDK.xcframework.zip"
VERSION_FILE="Package.swift"
USEREXPERIOR_PODSPEC_FILE="UserExperior.podspec"  # Your actual podspec file name
UECRASHREPORTER_PODSPEC_FILE="UECrashReporter.podspec"

# Function to display usage information
usage() {
    echo "Usage: $0 [major|minor|patch]"
    echo "If no argument is provided, it will default to 'patch'."
    exit 1
}

# Check if the zip file exists
if [ ! -f "$ZIP_NAME" ]; then
    echo "Error: $ZIP_NAME not found in the current directory."
    exit 1
fi

# Get the current version from Package.swift and podspec
CURRENT_VERSION=$(grep 'let version =' $VERSION_FILE | awk -F '"' '{print $2}')
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

# Increment based on the argument
case "$1" in
    major)
        MAJOR=$((MAJOR + 1))
        MINOR=0
        PATCH=0
        ;;
    minor)
        MINOR=$((MINOR + 1))
        PATCH=0
        ;;
    patch|""|*)
        PATCH=$((PATCH + 1))
        ;;
esac

NEW_VERSION="$MAJOR.$MINOR.$PATCH"

# Generate the new checksum
CHECKSUM=$(swift package compute-checksum "$ZIP_NAME")

# Update the version and checksum in Package.swift
sed -i '' "s/let version = \"$CURRENT_VERSION\"/let version = \"$NEW_VERSION\"/" $VERSION_FILE
sed -i '' "s/let checksum = \".*\"/let checksum = \"$CHECKSUM\"/" $VERSION_FILE

# Update version and source URL in the Podspec files
sed -i '' "s/s.version *= *'.*'/s.version                 = '$NEW_VERSION'/" $USEREXPERIOR_PODSPEC_FILE
sed -i '' "s|s.source *= *{.*}|s.source                  = { :http => \"https://raw.githubusercontent.com/UserExperior/ios-sdk/$NEW_VERSION/UserExperiorSDK.xcframework.zip\" }|" $USEREXPERIOR_PODSPEC_FILE

echo "Updated version to $NEW_VERSION and checksum to $CHECKSUM in both Package.swift and $USEREXPERIOR_PODSPEC_FILE"

# Lint the podspec files (local check)
# echo "Running podspec linting for local validation..."
# pod spec lint "$USEREXPERIOR_PODSPEC_FILE"
# pod spec lint "$UECRASHREPORTER_PODSPEC_FILE"

# # Push the podspec files to trunk with allow-warnings
# echo "Pushing podspecs to CocoaPods trunk..."
# pod trunk push "$USEREXPERIOR_PODSPEC_FILE" --allow-warnings
# pod trunk push "$UECRASHREPORTER_PODSPEC_FILE" --allow-warnings

# echo "Podspecs have been pushed to CocoaPods trunk."

# Stage, commit, and push all changes to the master branch
echo "Staging and committing changes..."
git add .
git commit -m "Bump version to $NEW_VERSION and update checksum"
git push origin master

# Create a new Git tag and push it
echo "Creating and pushing a new Git tag for version $NEW_VERSION"
git tag "$NEW_VERSION"
git push origin "$NEW_VERSION"

echo "Version $NEW_VERSION has been tagged and pushed to the Git repository."