# df-movies-catalog-ios
- iOS Application with 5 screens. Login, Search Movies, Favorites, Watchlist and MovieDetail 
- Written with **Swift 5**.
- Supports **iPhone**, **iOS 13** and above versions.

# Installation
 
- There are 2 dependencies which are included with `Cocoapods`. Please run `pod install` if you want to run project on your local.
- (Optional) (if you want to run project on your iOS device) Manage signing, change bundle identifier then run the project.

# How it works?

When you've launched to application you will be welcomed by Login screen. You can pass this view just clicking any button without giving any information.
- **Search Screen:** Works by the movie db `search/movie` endpoint and displays results via user search input.
- **Watchlist Screen:** Locally cached screen for watch list movies which are added by user in Movie Detail.
- **Favorites Screen:** Locally cached screen for favorites list movies which are added by user in Movie Detail.
- **Movie Detail Screen:** Contains brief informations about Movie. You are able to add movie to wathclist or favorites in here.

**[Application Video](overview.mov)**

## Guide
  You will be able to find:
  - Unit Tests under **LeanscaleCaseStudyTests**,
  - Some Extensions, protocols, and reusable views under  **Reusables**
  - All API Call related classes under **Network**.
  - Network target management, commonly used properties under **Global**
  - Image and color assets, Localization files and Launchscreen storyboard under **Resources**
  - Network and Session managers under **Managers**
  - All scenes separated under **Scenes**

## Notes About Project

### Architectural patterns

 - Used **MVP** and **MVVM** mixed pattern. Viewmodels should handle only logical parts of application (shouldn't import UIKit framework) like fetching requests, updating UserDefaults etc.. 
 - if leave all styling code to ViewControllers they will have bigger size on big projects. So, adding presentations will help on to reduce their size. 
 - Presentations also increase the reusability of views. Let's assume that we've different designed views which they've same properties. Let's say properties are `title` and `message`. They will have single presentation which holds these title and message information and will have different UI's. If I don't use Presentation for this example, I should include title and message informations into views for each.
