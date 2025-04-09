#!/bin/bash

# STEP 1: Import recent work contributions from private repo
git-import-contributions repo --repos C:/Users/maritra/StudioProjects/c51-mobile-android --mock_repo C:/Users/maritra/StudioProjects/mock-c51 --author "maritra@neptuneretailsolutions.com" --keep-commit-messages --start-from-last

# STEP 2: Move into the mock repo directory
cd C:/Users/maritra/StudioProjects/mock-c51 || exit 1

# STEP 3: Rewrite author and committer info using git-filter-repo
# This changes maritra@neptuneretailsolutions.com to mufratkarimaritra@gmail.com
git filter-repo --force --commit-callback '
    if commit.author_email == b"maritra@neptuneretailsolutions.com":
        commit.author_name = b"Mufrat Aritra"
        commit.author_email = b"mufratkarimaritra@gmail.com"
        commit.committer_name = b"Mufrat Aritra"
        commit.committer_email = b"mufratkarimaritra@gmail.com"
  '

# STEP 4: Push updated history to GitHub
git push --force origin main
