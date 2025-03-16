# Kalshi

Kalshi is a regulated exchange & prediction market where you can trade on the outcome of real-world events. We are now developing a new feature at our app to help people to keep track of their financial situation.

In order to do that, users should register information regarding their financial situation in our app. Two key pieces of information are his annual gross income and average monthly costs.

## Architecture

### Clean Architecture
Clean Architecture was used to ensure a well-organized and scalable structure. The core layers of the app include:

- Data Layer: Handles interactions with external resources such as APIs, databases or local storage. A service layer was created to perform business logic calculations, ensuring a clear separation of concerns. If the data source needs to switch to an external API in the future, the repository can easily adapt.
- Domain Layer: Contains the core business logic and entities. This layer remains independent of external frameworks, making it reusable and testable. Although use cases are not included yet, the structure allows their easy addition in the future.
- Presentation Layer:  Manages UI logic and state using Cubit.

### State Management with Cubit
Cubit was used to manage state due to its simplicity and efficiency. Cubit is easier to set up and use compared to other solutions and require minimal boilerplates. It also simplifies testing and integrates well with the project's architecture.

### Dependency Injection with GetIt
GetIt was used for dependency injection to keep the project modular and easily scalable. While the project is currently small, GetIt provides a solid foundation for managing dependencies as the codebase grows.

### Routing with GoRouter
Go Router was chosen for navigation because it offers a declarative approach that enhances code readability and maintainability. It supports deep linking and nested routes, making it a good choice for apps that are expected to grow in complexity.

### Design System and Design Tokens 

A simple Design System was implemented to enable the creation of reusable UI components across the application. Design tokens serve as a single source of truth for properties such as colors, typography, spacing and other visual elements. This approach ensures consistency throughout the app and makes it easy to scale as new features and components are added.

### Internationalization
Currently, the app is only available in English, but the structure allows for easy expansion to multiple languages in the future using the [Flutter Internationalization](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization).

### Testing
Unit and widget tests have been implemented to validate the behavior and integrity of individual UI components. These tests ensure that the components render correctly and function as expected.

🚀 Future Improvement: Integration tests can be introduced to cover full user flows, ensuring that the app behaves as expected in real-world scenarios.


## Requirements 

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.29.0

## Getting Started

Clone the repo
   ```sh
   git clone https://github.com/camillaromagnoli/kalshi.git
   ```

Navigation to root

 ```sh
   cd kalshi
   ```
Update dependencies

 ```sh
   flutter pub get
   ```
Run the project

 ```sh
   flutter run
   ```
## Contact

Camilla Romagnoli - [Linkedin](https://www.linkedin.com/in/camilla-romagnoli/) - [GitHub](https://github.com/camillaromagnoli)
