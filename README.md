## Weather App
### Screenshot
_There will be more later_
<img src="https://github.com/user-attachments/assets/e13d8065-3be3-4137-9a97-094757e2b45d" height="350" alt="Simulator Screenshot - iPhone 16 Pro - 2024-11-04 at 16 17 00">
  
### Instalation 
1. Get an free API key at [https://openweathermap.org](https://openweathermap.org)
2. Clone the repo
```
   git clone https://github.com/github_username/repo_name.git
```

3. Edit WeatherManager.swift, replace constant apiKey with your API key
```
// Before:
private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "API Key"

// After
private let apiKey = "your_api_key"
```
