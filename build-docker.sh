#!/bin/bash

VERSION=0.14.0
docker build --build-arg VERSION=$VERSION -t gradiant/gobblin:$VERSION .
