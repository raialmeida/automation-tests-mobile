# Uma imagem base do Maven com Java
FROM budtmo/docker-android:emulator_14.0

USER root

ARG MAVEN_VERSION=3.9.9

# Instalar Maven
RUN curl -fsSL https://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -xz -C /opt && \
    ln -s /opt/apache-maven-$MAVEN_VERSION/bin/mvn /usr/bin/mvn

# Diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo pom.xml para o contêiner
COPY ./pom.xml /app

# Copie o código de teste para o contêiner
COPY . /app