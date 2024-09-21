# weatherapp
 Flutter weather app
 This is a simple Flutter application that Display relevant weather information such as temperature, humidity, wind speed, and weather condition (e.g., sunny, cloudy, rainy).
 Implement basic caching mechanism in httpService to improve app performance and reduce network calls. 

## Features
- HomeTab:
  - When go to the page first it show current location weather
  - In textfield we can search wearch by city name or zip code
  - Weather page contain weather information temperature, humidity, wind speed, and weather condition 
  - hourly forecast showing bottom of the screen with a horizontal list
  
- forecast tab
  - top it show hourly forecast
  - 7 days weather reports list showing in second
  
- settings
 - we can change temperature unit

## State Management
This project uses **Flutter bloc** for state management

## Architecture
The app follows a clean architecture with separation of concerns:
- `core` : Contains constants, utils
- `data`: contains models(e.g., `weather`) and data source(e.g., `http`)
- `domain/repositories`: Contains the API service responsible for fetching products.
- `presentation/bloc`: Includes logic for fetching and managing weather state.
- `presentation/pages`: Contains the UI for the app 

## Setup Instructions

### Prerequisites
- Install Flutter: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Set up an Android/iOS emulator or a physical device for testing.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/hitanshu1/weatherapp.git
   cd weatherapp


