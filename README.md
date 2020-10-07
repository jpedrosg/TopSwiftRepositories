# TopSwiftRepositories.

Desenvolvido por Thiago Cavalcante de Oliveira.

[![IDE](https://img.shields.io/badge/Xcode-11.3-blue.svg)](https://developer.apple.com/xcode/)
[![Language](https://img.shields.io/badge/swift-5-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-13.3-green.svg)](https://developer.apple.com/ios/)
[![Build Status](https://travis-ci.com/jpedrosg/TopSwiftRepositories.svg?branch=master)](https://travis-ci.com/jpedrosg/TopSwiftRepositories.svg?branch=master)

# Introdução: 
Aplicativo iOS que tem como objetivo acessar a API do github de repositorios da linguagem JAVA e também visualizar todos os Pull Requests abertos desse repositorio.

## Screenshots

<img src="https://i.ibb.co/c3dVTQH/test-View-Controller-Flow-first-screen-3x.png" height="400" width="200">             <img src="https://i.ibb.co/ZKczJdF/test-View-Controller-Flow-pull-requests-screen-3x.png" height="400" width="200">        

Print 1 - Listagem de repositorios. 

Print 2 - Listagem de pull requests de um repositorio.


## API
- Lista de repositorios: https://api.github.com/search/repositories?q=language:Java&sort=stars&
- Pull requests de um repositorio: https://api.github.com/repos/NOME DO USUARIO/NOME DO REPOSITORIO/pulls


## Ferramentas utilizadas

- Xcode 11.3
- iOS 13.3
- Swift 5
- CocoaPods

## Testes

- Testes unitarios na camada do Interactor (quick e nimble)
- Testes de caixa preta (iOSSnapshotTestCase, KIF)
- Cobertura de teste de 87,2% do projeto
- Testes automatizados (Travis CI)

## Arquitetura utilizada

Neste projeto estou utilizando o Clean Swift.

Mais informações: https://clean-swift.com/clean-swift-ios-architecture/

## Features e diferenciais
- Testes de caixa preta utlizando iOSSnapshotTestCase e o KIF
- Integraçao contínua (Travis CI)
- Pull refresh
- Infinite scroll
- Internacionalização
- 100% Codeview

## Pods utilizados

#### SDWebImage (https://github.com/rs/SDWebImage)
Para carregar imagens e gerenciar cache.

#### PromiseKit (https://github.com/mxcl/PromiseKit)
Para trabalhar melhor com métodos assíncronos.

#### OHHTTPStubs (https://github.com/AliSoftware/OHHTTPStubs)
Para stubar requisições HTTP no teste integrado.

#### KIF (https://github.com/kif-framework/KIF)
Para teste integrado.

#### iOSSnapshotTestCase (https://github.com/uber/ios-snapshot-test-case)
Para teste de snapshot.

#### Quick (https://github.com/Quick/Quick)
Para testes unitários.

#### Nimble (https://github.com/Quick/Nimble)
Para testes unitários.

## Como compilar

1. Instale o CocoaPods caso não tenha instalado: https://cocoapods.org/
2. Vá até a pasta do projeto pelo terminal (a pasta que tem o arquivo `Podfile`)
3. Digite: `pod install`
4. Pronto. Agora basta abrir o projeto no XCode pelo arquivo **`TopSwiftRepositories.xcworkspace`**

OBS: Não abra pelo **`TopSwiftRepositories.xcodeproj`** pois os pods não serão carregados e dará erro na hora de compilar.

## Instruçōes para compilação dos testes de caixa preta
- Os testes de caixa preta foram configurados apenas no IPhone 11 Pro Max, ao executar os testes certifique-se que o simulador esteja nessa versão do iPhone.

## Instruçōes para compilação dos testes automatizados no terminal
- No Terminal, com a paste origem do projeto aberta, execute o comando:
```
xcodebuild build test -workspace TopSwiftRepositories.xcworkspace -scheme "TopSwiftRepositories" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=13.3,name=iPhone 8" PLATFORM_NAME=iphonesimulator ONLY_ACTIVE_ARCH=YES CODE_SIGNING_REQUIRED=NO

```
