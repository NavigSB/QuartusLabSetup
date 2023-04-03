#!/bin/bash

ls | grep -v -E '\.(do|sv|sh)?$|doFiles|scripts|src|Makefile' | xargs -i rm -rf {} 1>&2 >/dev/null
cd src
ls | grep -v -E '.sv' | xargs -i rm -rf {} 1>&2 >/dev/null