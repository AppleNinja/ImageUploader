# ImageUploader

An iOS app to upload and fetch images.

## Features

Image uploader has the following features:

- a gallery view of all previously uploaded images
- a button which can either request to take a picture, or upload from camera roll
- the ability to rotate or crop images

## Server

Firebase Storage

## Getting Started

1. Clone the repo
2. Go to the project directory
3. Run pod install

## Architectural Pattern

Clean Swift

## Tests

- UnitTests

## How to run the tests

1. Open the ImageUploader.xcworkspace in Xcode
2. Press ⌘ + U or go to Product -> Test
3. The application will get build and the test cases will be executed
4. Press the on the "Show the Report Navigator" button in Xcode
5. Press the coverage option under the test to see the code coverage

## Generate Code Coverage Report

1. Install Slather using command "sudo gem install slather" in the Terminal
2. Execute the Test Cases in Xcode as shown above
3. Run the below command in Terminal after giving the correct path to the ImageUploader.xcworkspace & ImageUploader.xcodeproj files
4. Code coverage report will be generated in the project directory and will get opened in your web browser

```bash
slather coverage --show --html --scheme ImageUploader --workspace path/to/ImageUploader.xcworkspace path/to/ImageUploader.xcodeproj

```

## Tools Used

MacOS 10.15.4, Xcode 11.4, iOS 13.4, iPhone 11 Pro Max
