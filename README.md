This is a docker image of [Apache Gobblin](https://gobblin.apache.org/).

## Properties

- This image has a small footprint ( base docker image is openjdk:8u171-jre-alpine3.7).

## Howto

The image entrypoint starts a gobblin standalone deployment by default. 

Important gobblin paths in the image are:

- GOBBLIN_WORK_DIR /root
- GOBBLIN_FWDIR /gobblin-dist
- GOBBLIN_JOB_CONFIG_DIR /etc/gobblin


## Example of usage
Put the job configuration in /etc/gobblin as a volume

```
docker run -d -v PATH_TO_GOBBLIN_JOB_CONFIG:/etc/gobblin gradiant/gobblin
```
