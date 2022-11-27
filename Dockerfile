#
# Copyright 2019-2022 Martin Goellnitz.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FROM debian:unstable-slim

ARG LAUNCH4J_VERSION=3.14

RUN \
  apt-get update && \
  apt-get install -yqq xz-utils curl unzip binutils-mingw-w64 openjdk-11-jdk && \
  set -eux && \
  curl -Lfo /tmp/l4j.tgz https://netix.dl.sourceforge.net/project/launch4j/launch4j-3/${LAUNCH4J_VERSION}/launch4j-${LAUNCH4J_VERSION}-linux-x64.tgz 2> /dev/null && \
  mkdir -p /opt && \
  cd /opt && \
  tar xzf /tmp/l4j.tgz && \
  rm -f /opt/launch4j/bin/ld /opt/launch4j/bin/windres /tmp/openjdk.tar.gz /tmp/l4j.tgz && \
  ln -s /usr/bin/i686-w64-mingw32-ld /opt/launch4j/bin/ld && \
  ln -s /usr/bin/i686-w64-mingw32-windres /opt/launch4j/bin/windres && \
  ln -s "$(dirname $(dirname $(readlink -f /etc/alternatives/javac)))" java && \
  apt-get clean

ENV JAVA_HOME "/opt/java"
ENV PATH "/opt/launch4j:$JAVA_HOME/bin:$PATH"
