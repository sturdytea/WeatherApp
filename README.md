<div align="row">
  <img src="https://github.com/user-attachments/assets/348a4c1b-4b43-46bc-82ef-f4abd050892c" style="width: 10%">  
  <h1>Weather App 🌦️</h1>
</div>

It's a simple and minimalist weather app that provides current weather information. The app uses the OpenWeatherMap API to fetch real-time and hourly forecast weather data, air quality index, and other useful details.  

## Technologies Used 
- __Stack__: SwiftUI, Combine, CoreLocation
- __Architecture__: MVVM
- __Patterns__: DI
- __Third-Party APIs__: OpenWeatherMap API
  
## Installation 
1. Clone the repo:
```
   git clone https://github.com/github_username/repo_name.git
```

2. Open the project in Xcode:
```
cd AstanaWeatherApp
open AstanaWeatherApp.xcodeproj
```

## Configuration
To use the app, you need an API key.

1. Sign in and get an free API key at [https://openweathermap.org](https://openweathermap.org)

2. Edit __WeatherManager.swift__, replace constant apiKey with your API key:
```
// Before:
private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "API Key"

// After
private let apiKey = "your_api_key"
```

## Screenshots
> There will be more later

<div align="row">
  <img src="https://github.com/user-attachments/assets/e13d8065-3be3-4137-9a97-094757e2b45d" height="350" alt="Simulator Screenshot - iPhone 16 Pro - 2024-11-04 at 16 17 00">
</div>

## Future Enhancements 
- [ ] __Replace weather icon with 3D Images.__: UI looks too colorless.
- [ ] __Add City Search.__: Allow user to search for weather in other cities.
- [ ] __Build Widget for Home Screen.__: Users should know current weather without opening the app.

