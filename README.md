# The Movies

A simple iOS application built using **UIKit** that fetches movie data from The Movie Database API and displays movies in a table view.

## Features

- Fetches movie data from an API
- Displays movies in a `UITableView`
- Shows movie poster images
- Uses reusable custom table view cells
- Shows an activity indicator while data loads
- Opens a movie detail screen when a row is selected
- Uses a scroll view for long movie descriptions
- Programmatic UI using Auto Layout
- Downloads images using `URLSession`

## Screens
<img width="295" height="640" alt="Simulator Screen Recording - iPhone 17 Pro - 2026-06-24 at 15 34 44" src="https://github.com/user-attachments/assets/21df09ce-faa2-424b-8955-8d31386b803a" />


### Movie List Screen

The first screen displays a list of movies.

Each movie row contains:

- Movie poster image
- Movie title
- Popularity score
- Release year

### Movie Detail Screen

When a user selects a movie, the app opens a detail screen.

The detail screen contains:

- Movie poster
- Movie title
- Movie overview
- Popularity score
- Rating
- Release date
- Vote count

The detail screen uses `UIScrollView` so the user can scroll when the overview is long.

## Technologies Used

- Swift
- UIKit
- UITableView
- UITableViewCell
- UIScrollView
- URLSession
- JSONDecoder
- Auto Layout
- SF Symbols
- The Movie Database API

## Project Structure

```text
TheMovies
│
├── Models
│   ├── Movie.swift
│   └── MovieResponse.swift
│
├── ViewControllers
│   ├── MovieListVC.swift
│   └── MovieDetailVC.swift
│
├── Views
│   └── MovieCell.swift
│
├── Network
│   └── NetworkManager.swift
│
├── Extensions
│   └── UIImageView+Extension.swift
│
└── Utilities
    ├── URLs.swift
    └── CellNames.swift
