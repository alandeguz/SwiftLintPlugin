# SwiftLintPlugin


[![Language: Swift](https://img.shields.io/badge/language-swift-f48041.svg?style=flat)](https://developer.apple.com/swift)
![Version: swift version 5.7](https://img.shields.io/badge/swift-5.7-F16D39.svg?style=flat)
![Platform: iOS 14.0+ macOS 12.4+](https://img.shields.io/badge/target-iOS%2013.7%2B%20macOS%2012.4%2B-blue.svg?style=flat)
[![Xcode](https://img.shields.io/badge/Xcode-14+-007ACC?style=&logo=Xcode&logoColor=white)](https://developer.apple.com/xcode/)

A Swift package plugin implementation for `SwiftLint`

* [Summary](#summary)
* [Setup](#setup)
* [Example](#example)

## Summary
This project defines an Xcode plugin that leverages the current release of the official [SwiftLint](https://github.com/mono0926/SwiftLint) project. Although the SwiftLint project recently added a plugin to its repo, the repo also includes all the source for building the project. Hence importing the plugin adds _**nine**_ package dependencies. This implementation only adds one.

## Setup

* On the Package Dependecies tab, click on the `+` button to add a dependency.

![plus](https://user-images.githubusercontent.com/4161830/196003313-e48cd0a3-61f1-4f82-8773-5ccf84f7a286.png)

* Enter `https://github.com/alandeguz/SwiftLintPlugin` into the search field, and click on `Add Package`.

![02_add](https://user-images.githubusercontent.com/4161830/196332752-5d8a393a-535d-4bd8-8aea-7f1a138aa813.png)

* Because this a plugin (and *not* code intended for the app), no target will be listed in this dialog. Simply click on `Add Package` here.

![03_choose](https://user-images.githubusercontent.com/4161830/196333045-49b37405-244e-4de7-84c5-a8de6c556ede.png)

* Select your Target, then go to `Build Phases`, expand `Run Build Tool Plug-ins`.

![run](https://user-images.githubusercontent.com/4161830/196003575-a6de8f15-9429-4d09-94aa-fbe7af526a33.png)

* Click on the `+` button to bring up the plugin chooser dialog. Click on `SwiftLint` then `Add`.

![05_select](https://user-images.githubusercontent.com/4161830/196333067-86c2e27f-448f-45fa-b9d2-f8c42ab6f438.png)

* Configure a `.swiftlint.yml` file and place it into your project directory, same path as the `*.xcodeproj` file. [SwiftLint](https://github.com/mono0926/SwiftLint) repo for more details. 

## Example

An example project is available from the [ExampleApp](https://github.com/alandeguz/ExampleApp) repository.
