# Imagem base
FROM openjdk:21-jdk-slim

# Definir argumentos para versões
ARG NODE_VERSION=20.x
ARG MAVEN_VERSION=3.9.9
ARG ANDROID_SDK_ROOT=/opt/android-sdk
ARG APPIUM_VERSION=2.11.3

# Atualizar os pacotes e instalar dependências essenciais
RUN apt-get update && \
    apt-get install -y \
    curl \
    gnupg2 \
    procps \
    software-properties-common \
    unzip \
    libgl1-mesa-dev \
    libx11-dev \
    libxkbcommon-x11-0 \
    libxrender1 \
    libxtst6 \
    libqt5webkit5 \
    libgconf-2-4 \
    xvfb \
    gnupg \
    libpng16-16 \
    libxi6 \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*an

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
    sdkmanager "platform-tools" \
    "build-tools;35.0.0" \
    "platforms;android-35" \
    "cmdline-tools;latest" \
    "cmake;3.22.1" \
    "tools" \
    "ndk;27.1.12297006" \
    "emulator" \
    "system-images;android-31;google_apis_playstore;x86_64" \
    "extras;android;m2repository" \
    "extras;google;m2repository"

# Instalar emulador Android e criar um dispositivo virtual (AVD)
RUN echo "no" | avdmanager create avd -n test -k "system-images;android-31;google_apis_playstore;x86_64" --force

# Iniciar o emulador Android
RUN $ANDROID_HOME/emulator/emulator -avd test -no-window -no-audio -no-snapshot -no-accel -read-only &

# Instalar Appium
RUN npm install -g appium@${APPIUM_VERSION} && \
    npm install -g appium-doctor

#Instalar uiautomator2
RUN appium driver install uiautomator2

# Verificar Appium
RUN appium-doctor --ios --android

# Expor portas (para o Appium, por exemplo)
EXPOSE 4723

# Diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo pom.xml para o contêiner
COPY ./pom.xml /app

# Copie o código de teste para o contêiner
COPY . /app

# Comando padrão (se aplicável)
CMD ["bash"]