#!/usr/bin/env bash

teste=$(gh release list --exclude-drafts --exclude-pre-releases --limit 1 | awk '{print $3}')

echo $teste