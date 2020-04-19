docker build -t koduki/theia .


'''bash
docker pull gcr.io/google.com/cloudsdktool/cloud-sdk:latest
docker run gcr.io/google.com/cloudsdktool/cloud-sdk:latest gcloud version
docker run -ti --name gcloud-config gcr.io/google.com/cloudsdktool/cloud-sdk gcloud auth login

echo "alias gcloud='docker run -it --rm --volumes-from gcloud-config -v `pwd`:/work --workdir /work gcr.io/google.com/cloudsdktool/cloud-sdk:latest gcloud'" >> ~/.bashrc

```

