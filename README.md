# MovieApp

[![Swift Version](https://img.shields.io/badge/Swift-5.9-brightgreen.svg)](https://swift.org) [![Xcode Version](https://img.shields.io/badge/Xcode-15-brightgreen.svg)](https://developer.apple.com/xcode/) [![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

## Overview

The Movie App is a Swift-based iOS application that allows users to discover and explore a curated list of movies. The app fetches information about movies from a remote server, providing users with details such as movie title, overview, and posters. Users can navigate through the list of movies, sort them based on different criteria, and view detailed information about each movie.

## Features

- **List of Movies:** Fetch and display a list of movies from a remote server.
- **Sorting:** Allow users to sort the list of movies based on different criteria (e.g., popularity, revenue, vote average).
- **Movie Details:** Provide detailed information about each movie, including title, overview, and poster images.

## Architecture 
The MovieApp follows a clean and modular architecture to promote maintainability, scalability, and testability. The key components of the architecture include: 
-  **MVVM (Model-View-ViewModel):** The app adopts the MVVM design pattern, separating concerns between the UI (View), business logic (ViewModel), and data (Model). This promotes a clear separation of concerns and enables better unit testing. 
-  **Repository Pattern:** Data access is abstracted through repositories, providing a clean API to fetch and store movie-related data. This pattern enhances code maintainability and facilitates the switch between different data sources. 
-  **Dependency Injection:** Dependencies are injected into components, promoting a loosely coupled architecture. This enhances testability and allows for easy replacement of components.

## Dependencies 
The Movie App is written entirely in Swift and doesn't rely on any third-party libraries or frameworks. The use of native code ensures optimal performance, easier maintenance, and a reduced app footprint.

## Requirements

- iOS 17.0+
- Swift 5.9+
- Xcode 15.0+

## Installation

To run the Movie App locally, follow these steps:

```bash
# Clone the repository
git clonehttps://github.com/HussamElsadany/MoviesApp.git

# Navigate to the project directory
cd MovieApp

# Open the project in Xcode
open MoviesApp.xcworkspace
