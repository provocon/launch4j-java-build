# Build Image for Launch4j with a suitable Java Development Kit

Package Java Applications for Windows x86_64 with the Launch4j Wrapper even if
the CI is not running on x86_64 / Intel / AMD.

This image provides a patched version of [Launch4j][launch4j] available for
build processes using e.g. [GitLabCI][gitlabci]. It based on
[Debian GNU Linux][debian] `unstable` with [OpenJDK][openjdk] to be usable at
least for amd64, arm64/v8, and riscv64 architectures.

In detail this image is intended for CI environments like to provides:

* Debian slim

* OpenJDK Java Development Kit 17

* Launch4j

The home of this repository is at [github][github] with a mirror at
[gitlab][gitlab].


## Feedback

Please use the [issues][issues] section of this repository at [github][github] 
for feedback. 


## Availability

This container can be used via the canonical name `provocon/java`.
Besides the tag `latest` the version tags `11` and `17` for [OpenJDK][openjdk]
versions 11 and 17 should be self explanatory.


## Build

### Scripted Build

You can use the [Gradle Build Tool][gradle] and issue

```
./gradlew -Ptag=17
```

to generate the container with the tag 17. The default value for the tag 
paramter is `latest`

### Manual Build

The further preparation of the container is accomplished using the usual:

```
podman build -t provocon/java:17 .
podman build -t provocon/java:latest .
podman push provocon/java:17
podman push provocon/java:latest
```

```
docker build -t provocon/java:17 .
docker build -t provocon/java:latest .
docker push provocon/java:17
docker push provocon/java:latest
```

### CI Builds

CI Builds use the buildx plugin for docker to provide images for the intended
architectures.


## Test

```
$ docker run -it --rm provocon/java:latest java -version
openjdk version "11.0.17" 2022-10-18
OpenJDK Runtime Environment (build 11.0.17+8-post-Debian-2)
OpenJDK 64-Bit Server VM (build 11.0.17+8-post-Debian-2, mixed mode, sharing)
```


## References

Project icon by Ken Kistler `CC0 "Public Domain"` on 
`https://www.publicdomainpictures.net/`

`https://www.publicdomainpictures.net/pictures/90000/velka/desert-pipeline.jpg`

[gitlabci]: https://gitlab.com/
[issues]: https://github.com/provocon/launch4j-java-build/issues
[github]: https://github.com/provocon/launch4j-java-build
[gitlab]: https://gitlab.com/provocon/launch4j-java-build
[debian]: https://www.debian.org/
[launch4j]: http://launch4j.sourceforge.net/
[openjdk]: https://openjdk.org/
