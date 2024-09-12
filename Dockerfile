# Uma imagem base do Maven com Java
FROM maven:3.8.7-openjdk-18-slim

# Instalações básicas
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    android-tools-adb \
    build-essential &&
    rm -rf /var/lib/apt/lists/*

# Instalar Android SDK
ENV ANDROID_SDK_ROOT /usr/local/android-sdk-linux
RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools &&
    curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip &&
    unzip sdk-tools.zip -d $ANDROID_SDK_ROOT/cmdline-tools &&
    rm sdk-tools.zip

# Aceitar Licenças do Android SDK
RUN yes | $ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager --licenses

# Instalar plataformas e ferramentas Android necessárias
RUN $ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager --update &&
    $ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager "platform-tools" "platforms;android-30"

# Instalar Appium
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - &&
    apt-get install -y nodejs &&
    npm install -g appium

# Diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo pom.xml para o contêiner
COPY ./pom.xml /app

# Copie o código de teste para o contêiner
COPY . /app
