README
============

This is a cloud IDE with Eclipse Theia. 

https://hub.docker.com/r/koduki/theia

## Build

```bash
$ docker build -t koduki/theia .
```

## Run

```bash
$ docker run -it --rm -p3000:3000 koduki/theia  
```

## Deploy to GCP

```
$ gcloud beta compute instances create-with-container \
    ins-theia \
    --zone=asia-northeast1-b \
    --machine-type=e2-standard-2 \
    --preemptible \
    --subnet=default --no-address \
    --tags=theia \
    --image-family=cos-stable \
    --image-project=cos-cloud \
    --container-image=koduki/theia \
    --container-restart-policy=always \
    --container-mount-host-path=mount-path=/home/project,host-path=/var/theia,mode=rw \
    --container-mount-host-path=mount-path=/var/run/docker.sock,host-path=/var/run/docker.sock,mode=rw \
    --metadata-from-file startup-script=config.sh

$  gcloud compute start-iap-tunnel ins-theia 3000 --local-host-port=localhost:3000 --zone asia-northeast1-b
```

You can also refre this document to deploy GCP.
- https://qiita.com/koduki/items/1530ca0a71d7f18b2064

## Cloud Build

```bash
$ gcloud builds submit --substitutions=_DOCKERHUB_UID=koduki
```
