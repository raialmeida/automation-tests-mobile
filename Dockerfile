# Imagem base
FROM openjdk:21-jdk-slim

# Definir argumentos para versões
ARG NODE_VERSION=20.x
ARG MAVEN_VERSION=3.9.9
ARG ANDROID_SDK_ROOT=/opt/android-sdk
ARG APPIUM_VERSION=2.11.3

# Atualizar os pacotes e instalar dependências essenciais
RUN apt-get update && \
    apt-get install -y curl gnupg2 procps software-properties-common unzip && \
    apt-get install -y ca-certificates && \
    apt-get clean

# Instalar Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Instalar Maven
RUN curl -fsSL https://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -xz -C /opt && \
    ln -s /opt/apache-maven-$MAVEN_VERSION/bin/mvn /usr/bin/mvn

# Instalar Android Studio (Command Line Tools)
RUN mkdir -p $ANDROID_SDK_ROOT && \
    curl -fsSL https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -o /tmp/cmdline-tools.zip && \
    unzip /tmp/cmdline-tools.zip -d /opt/android-sdk/cmdline-tools && \
    rm /tmp/cmdline-tools.zip && \
    mv /opt/android-sdk/cmdline-tools/cmdline-tools /opt/android-sdk/cmdline-tools/latest

# Configurar variáveis de ambiente
ENV PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"
ENV ANDROID_HOME=$ANDROID_SDK_ROOT

# Instalar pacotes Android
RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "build-tools;35.0.2" "platforms;android-35"

# Instalar Appium
RUN npm install -g appium@${APPIUM_VERSION} && \
    npm install -g appium-doctor

# Verificar Appium
RUN appium-doctor --ios --android

# Expor portas (para o Appium, por exemplo)
EXPOSE 4723

# Comando padrão (se aplicável)
CMD ["bash"]