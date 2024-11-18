#!/bin/bash

## find files with that extension
find -name '*yaml*'

## multiple change filename yaml extension
for a in *.yaml; do mv -- "$a" "${a%.yaml}.yml"; done

## multiple change filename yml extension
for f in *.yaml; do mv -n -- "$f" "${f%.yml}"; done
