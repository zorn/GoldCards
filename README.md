# GoldCards

A Hearthstone reference app for iOS.

## Tools

* We use [CocoaPods](http://cocoapods.org) for managing third party code. We make sure to actually commit these pods to the repo so you shouldn't need to install cocoapods to work on this project, but you would need to install it to add, remove or update a pod. (Reinstalling pods is also sometimes required after making an major project setting change, like adding a new architecture.)
* We use [mogenerator](https://github.com/rentzsch/mogenerator) (as in Managed Object Generator) to help build model class files from our CoreData Model. This is a command line tool that can be installed directory or via systems like homebrew. Like CocoaPods we commit the generated code so you won't need to install mogenerator unless you are updating the core data model file. When you do, from the root project folder, use a command like this to update the class files:

~~~~
mogenerator --model GoldCards/Source/GoldCardsSchema.xcdatamodeld/GoldCardsSchema.xcdatamodel \
--template-var arc=true \
--output-dir GoldCards/Source
~~~~