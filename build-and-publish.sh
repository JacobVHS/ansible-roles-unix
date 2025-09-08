#!/bin/bash
# This script builds and publishes an Ansible collection to Ansible Galaxy.

# Build the Ansible collection
echo "Building the Ansible collection"
ansible-galaxy collection build . --force
if [ $? -eq 0 ]; then
    echo "Collection built successfully"
else
    echo "Collection build failed"
    exit 1
fi

# Publish the Ansible collection
echo "Publishing the Ansible collection"
ansible-galaxy collection publish ./*.tar.gz --token $ANSIBLE_GALAXY_TOKEN
if [ $? -eq 0 ]; then
    echo "Collection published successfully"
else
    echo "Collection publish failed"
    exit 1
fi

# # Clean up the built collection file
# echo "Cleaning up the built collection file"

# # Check if any .tar.gz files exist
# if ls ./*.tar.gz 1> /dev/null 2>&1; then
#     echo ".tar.gz files found, proceeding with cleanup"
#     rm ./*.tar.gz
#     if [ $? -eq 0 ]; then
#         echo "Cleanup successful"
#     else
#         echo "Cleanup failed"
#         exit 1
#     fi
# else
#     echo "No .tar.gz files found, skipping cleanup"
#     exit 0
# fi
