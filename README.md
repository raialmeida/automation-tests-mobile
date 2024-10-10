# Projeto de Automação de Testes Mobile com Java, Maven e Appium

Este repositório contém a automação de testes mobile utilizando **Java**, **Maven** e **Appium**. O objetivo deste projeto é fornecer uma estrutura básica para a execução de testes automatizados em dispositivos móveis (Android), garantindo qualidade e eficiência nos processos de teste.

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Como Executar os Testes](#como-executar-os-testes)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Pré-requisitos

Antes de configurar e executar o projeto, certifique-se de ter as seguintes ferramentas instaladas:

- **Java Development Kit (JDK)** 17 ou superior
- **Maven** para gerenciamento de dependências
- **Node.js** (para rodar o servidor do Appium)
- **Appium Desktop** ou Appium Server (CLI)
- **Android SDK** e/ou **Xcode** (para dispositivos iOS)
- **Emulador Android** ou **Simulador iOS** ou dispositivos físicos para execução dos testes

## Instalação

### Clonando o Repositório

Clone o repositório para a sua máquina local:

```bash
git clone https://github.com/raialmeida/automation-tests-mobile.git
```

## Como Executar os Testes

```
mvn install
```

Executar todos os testes
```
mvn test
```

## Estrutura do Projeto

- src/main/resources: Contém APK android
- src/test/java/core: Código com as configurações dos testes.
- src/test/java/Screens: Pasta que contém as telas com métodos e ações.
- src/test/java/tests: Contém arquivos com os testes 
- src/test/java/utils: Contém utilitários dos testes.
- pom.xml: Arquivo de configuração do Maven.
- target: Pasta criada na execução que vão armazenar reports do testes.

## Contribuição

Sinta-se à vontade para contribuir com melhorias neste projeto. Para contribuir:

1. Faça um clone do projeto.
2. Crie uma branch para sua feature (git checkout -b feature/nova-feature).
3. Envie suas mudanças (git commit -am 'Adiciona nova feature').
4. Faça o push da branch (git push origin feature/nova-feature).
5. Crie um Pull Request.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo LICENSE para mais detalhes.