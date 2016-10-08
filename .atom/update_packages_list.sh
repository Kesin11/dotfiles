#!/bin/sh

apm list --installed --bare > packages.txt

echo "check packages.txt"
echo "# git diff packages.txt"
