# build_beats

Containerized env to build Elastic Beats

Use the following command to build this container.  Change the tag as needed.

```bash
docker run --rm -i hadolint/hadolint:v1.15.0 < Dockerfile
docker build -t johnnypetersringo/build_beats:0.1.0 .
CI=true dive johnnypetersringo/build_beats:0.1.0
docker run --rm -it johnnypetersringo/build_beats:0.1.0 /bin/bash

docker login
docker push johnnypetersringo/build_beats:0.1.0
docker logout
```
