# JustGroceries - Simple Shopping App

JustGroceries is a simple Flutter-based shopping app that allows users to browse products, add items to their cart, and proceed to checkout. This app demonstrates the basic functionality of a shopping application without using any third-party libraries.

## Features

- Bottom navigation bar for easy navigation between Products and Checkout screens.
- Static list of products with images, names, prices, and ratings.
- Add and remove items from the cart.
- Checkout screen to review items in the cart.
- Order successful screen after placing an order.

## Screenshots

![Products Screen](https://github.com/khachy/shop-app/assets/79975855/3dfc20b9-ad42-4d48-9cca-47af045930ee)
![Cart Screen](https://github.com/khachy/shop-app/assets/79975855/9a84e6af-9c3e-47fe-a378-eb396d8bf510)
![Checkout Screen](https://github.com/khachy/shop-app/assets/79975855/c1f319f8-3d82-4ff0-b672-fa35e8a6468f)
![Order Success](https://github.com/khachy/shop-app/assets/79975855/746fcbe8-6afc-486f-99bc-a6d037c4f91b)


## APK Testing

Test the APK for fun [here](https://appetize.io/app/syhzri7o3k333m5d4vrszxe63e?device=pixel7&osVersion=13.0).

## Setup Instructions

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Android Studio or Visual Studio Code with Flutter and Dart plugins
- A physical device or emulator to run the app

### Step-by-Step Guide

1. **Clone the repository**
   ```bash
   git clone https://github.com/khachy/shop-app.git
   cd shop-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build APK**
   ```bash
   flutter build apk --release
   ```
   The generated APK can be found in the `build/app/outputs/flutter-apk` directory.

## Project Structure

```
lib
│
├── main.dart               # Entry point of the application
├── models
│   ├── cart_model.dart     # Cart model
│   └── product_model.dart  # Product model
├── provider
│   └── cart_provider.dart  # Cart provider for state management using inherited widget
├── screens
│   ├── checkout_screen.dart      # Checkout screen
│   ├── order_success_screen.dart # Order success screen
│   └── products_page.dart        # Products listing screen
├── utils
│   ├── grocery_options.dart  # Utility for grocery options
│   └── product_tile.dart     # Widget for displaying product tiles
```

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add new feature'`)
5. Push to the branch (`git push origin feature-branch`)
6. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

