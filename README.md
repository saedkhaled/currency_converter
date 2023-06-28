# currency_converter

Welcome to the Currency Converter App! This application is a user-friendly, efficient mobile application designed to
convert any type of currency.

Built with Flutter, it works seamlessly on both iOS and Android platforms.

## Features

- Extensive Currency Support: This application supports conversion for a broad range of global currencies.
- Real-Time Conversion Rates: By using an external API, the application offers real-time currency conversion rates.
- Ease of Use: The application comes with a user-friendly UI for easy navigation and quick conversions.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing
purposes.

### Prerequisites

Before you begin, ensure that you have met the following requirements:

- Flutter SDK installed on your machine.
- An IDE with Flutter plugin (such as Android Studio or Visual Studio Code).
- An active internet connection to fetch the real-time conversion rates.e.

### Installation

1. Clone this repository.
   ```sh
   git clone https://github.com/saedkhaled/currency_converter.git
    ```
2. Move into the project directory.
   ```sh
   cd currency_converter
    ```
3. Get Flutter packages.
   ```sh
   flutter pub get
    ```

### Configuration

This project requires an .env file to run correctly. The .env file should be located in the root of the project and
should contain the following environment variables:

```
CONVERTER_API_KEY=<your-api-key-here>
```

Please replace <your-api-key-here> with the API key obtained from the CurrencyFreaks API.

### Building and Running the App

Once you have configured your environment, you can build and run the app.
    
