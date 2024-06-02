# Chat Demo Application

![Flutter](https://img.shields.io/badge/Flutter-v2.5.3-blue) 
![Dart](https://img.shields.io/badge/Dart-v2.14.4-blue) 
![Coverage](https://img.shields.io/badge/Coverage-84.9%25-brightgreen)

This is a sophisticated demo chatting application built using Flutter. The application features a robust authentication system and a well-structured contacts management system, adhering to the best practices in software development.

## Features
- **Authentication**: Secure login using JWT tokens.
- **Contacts Management**: Fetch and display user contacts from a REST API.
- **Automated Testing**: Extensive test coverage exceeding 84.9%.
- **UI/UX Design**: Fully adherent to the provided Figma design.
- **State Management**: Utilizing the Bloc pattern for effective state management.
- **Localization**: Multi-language support for better user experience.
- **Clean Architecture**: Strict adherence to SOLID principles and clean architecture.
- **Network Layer**: Efficient and secure network request handling.
- **Error Handling**: Comprehensive error handling strategies.

## Features Directory

- Each feature is self-contained and includes its own data, domain, and presentation layers.

    - login: Manages user authentication.
        data: Data sources, models, and repositories for login.
        domain: Entities and use cases related to login.
        presentation: Blocs, screens, and widgets for the login feature.
    - contacts: Manages user contacts.
        data: Data sources, models, and repositories for contacts.
        domain: Entities and use cases related to contacts.
        presentation: Blocs, screens, and widgets for the contacts feature.

 Shared Directory

- The shared directory contains components that are used across multiple features.

    -  data_source: Common data sources.
    -  presentation: Shared widgets used across different features.

    
## Running Tests
To run the automated tests and generate a coverage report, use:

```sh
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```
![Screenshot 2024-06-02 at 2 07 03 AM](https://github.com/elmemy/Chat_Flutter/assets/13080678/37730605-d5c0-4d29-a279-d4dedfe967b4)

## Project Structure

```sh
lib/
├── core/
│   ├── error/
│   │   ├── exceptions.dart
│   │   ├── failures.dart
│   ├── base_use_cases/
│   │   ├── usecase.dart
│   ├── localization/
│   │   ├── app_localizations.dart
│   ├── network/
│   │   ├── api_client.dart
│   │   ├── network_info.dart
│   ├── theme/
│   │   ├── colors.dart
│   │   ├── theme.dart
│   ├── util/
│   │   ├── input_converter.dart
│   ├── locator.dart
├── features/
│   ├── login/
│   │   ├── data/
│   │   │   ├── data_source/
│   │   │   │   ├── login_data_source.dart
│   │   │   ├── model/
│   │   │   │   ├── user/
│   │   │   │   │   ├── user_model.dart
│   │   │   │   │   ├── user_model.g.dart
│   │   │   ├── repository/
│   │   │   │   ├── login_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── user.dart
│   │   │   ├── usecases/
│   │   │   │   ├── login_usecase.dart
│   │   │   ├── repositiories/
│   │   │   │   ├── login_repository.dart
│   │   ├── presentation/
│   │   │   ├── blocs/
│   │   │   │   ├── login_bloc.dart
│   │   │   │   ├── login_event.dart
│   │   │   │   ├── login_state.dart
│   │   │   ├── screens/
│   │   │   │   ├── login_screen.dart
│   │   │   ├── widgets/
│   │   │   │   ├── google_button_widget.dart
│   │   │   │   ├── have_account_widget.dart
│   │   │   │   ├── login_bloc_consumer.dart
│   │   │   │   ├── login_button_widget.dart
│   │   │   │   ├── or_widget.dart
│   │   │   │   ├── text_field_widget.dart
│   ├── contacts/
│   │   ├── data/
│   │   │   ├── data_source/
│   │   │   │   ├── contacts_data_source.dart
│   │   ├── models/
│   │   │   │   ├── contact/
│   │   │   │   │   ├── contact_model.dart
│   │   │   │   │   ├── contact_model.g.dart
│   │   │── repositories/
│   │   │   │   ├── contact_repository_impl.dart
│   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── contact.dart
│   │   │   ├── usecases/
│   │   │   │   ├── get_contacts_usecase.dart
│   │   │── repositories/
│   │   │   │   ├── contact_repository.dart
│   ├── presentation/
│   │   │   ├── blocs/
│   │   │   │   ├── contacts_bloc.dart
│   │   │   │   ├── contacts_event.dart
│   │   │   │   ├── contacts_state.dart
│   │   │   ├── screens/
│   │   │   │   ├── contacts_screen.dart
│   │   │   ├── widgets/
│   │   │   │   ├── contacts_item_widget.dart
│   │   │   │   ├── title_contacts_widget.dart
├── shared/
│   ├── data_source/
│   │   ├── local_data_source.dart
│   ├── presentation/
│   │   │   ├── widgets/
│   │   │   │   ├── error_title_widget.dart
│   │   │   │   ├── error_widget.dart
│   │   │   │   ├── loader_widget.dart
│   │   │   │   ├── contacts_item_widget.dart
│   │   │   │   ├── text_form_field_widget.dart

```

## Test Structure

```sh
test/
├── core/
│   ├── base_use_case/
│   │   ├── usecase_test.dart
│   │   ├── usecase_test.mocks.dart
│   ├── error/
│   │   ├── exceptions_test.dart
│   │   ├── failures_test.dart
│   ├── network/
│   │   ├── network_info_test.dart
│   │   ├── network_info_test.mocks.dart
├── features/
│   ├── login/
│   │   ├── data/
│   │   │   ├── data_source/
│   │   │   │   ├── login_data_source_test.dart
│   │   │   │   ├── login_data_source_test.mocks.dart
│   │   │   ├── model/
│   │   │   │   ├── user/
│   │   │   │   │   ├── user_model_test.dart
│   │   │   ├── repository/
│   │   │   │   ├── login_repository_impl_test.dart
│   │   │   │   ├── login_repository_impl_test.mocks.dart
│   │   ├── domain/
│   │   │   ├── usecases/
│   │   │   │   ├── login_usecase_test.dart
│   │   │   │   ├── login_usecase_test.mocks.dart
│   │   ├── presentation/
│   │   │   ├── blocs/
│   │   │   │   ├── login_bloc_test.dart
│   │   │   │   ├── login_bloc_test.mocks.dart
│   │   │   │   ├── login_event_test.dart
│   │   │   │   ├── login_state_test.dart
│   ├── contacts/
│   │   ├── data/
│   │   │   ├── data_source/
│   │   │   │   ├── contacts_data_source_test.dart
│   │   │   │   ├── contacts_data_source_test.mocks.dart
│   │   │   ├── models/
│   │   │   │   ├── contact/
│   │   │   │   │   ├── contact_model_test.dart
│   │   ├── repositories/
│   │   │   │   ├── contact_repository_impl_test.dart
│   │   │   │   ├── contact_repository_impl_test.mocks.dart
│   ├── domain/
│   │   ├── usecases/
│   │   │   ├── get_contacts_usecase_test.dart
│   │   │   ├── get_contacts_usecase_test.mocks.dart
│   ├── presentation/
│   │   ├── blocs/
│   │   │   ├── contacts_bloc_test.dart
│   │   │   ├── contacts_bloc_test.mocks.dart
│   │   │   ├── contacts_event_test.dart
│   │   │   ├── contacts_state_test.dart
├── shared/
│   ├── data_source/
│   │   ├── local_data_source_test.dart
│   │   ├── local_data_source_test.mocks.dart

```
