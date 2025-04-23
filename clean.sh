#!/bin/bash

rm -rf build/ pcdet.egg-info/ dist/ .eggs/ .setuptools-cfg .venv
find . -type f -name "*.so" -exec rm -f {} \;
find . -type d -name "__pycache__" -exec rm -rf {} \; -prune
