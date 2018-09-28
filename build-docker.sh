#!/bin/bash

VERSION=0.11.0
docker build --build-arg VERSION=$VERSION -t gradiant/gobblin:$VERSION .
