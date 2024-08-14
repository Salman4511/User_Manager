# User Manager

**User Manager** is a Flutter application designed to manage user information with features like mobile authentication, user addition, search, and sorting. It leverages Firebase for data storage and authentication, Provider for state management, and follows the MVC architecture with clean and organized code.

## Features

1. **Mobile Authentication with OTP Verification**
   - Users can log in using their mobile number with actual OTP verification.

2. **Add User**
   - Users can be added with their name, age, and image.
   - User details are stored in Firebase.

3. **Search User**
   - Search users by age or name.

4. **Sorting**
   - Users can be sorted into two categories based on age: 
     - Older (age 60 and above)
     - Younger (age below 60)

## Architecture

- **MVC (Model-View-Controller)**
  - **Model**: Represents the data and business logic.
  - **View**: UI components and user interactions.
  - **Controller**: Manages the logic and updates the view and model accordingly.

```
lib/
├── main.dart
├── models/
│   ├── user_model.dart
├── views/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── otp_screen.dart
│   ├── home/
│   │   ├── home_screen.dart
│   │   ├── add_user_screen.dart
│   ├── widgets/
│       ├── user_list_tile.dart
│       ├── top_bar_widget.dart
│ 
├── controllers/
│   ├── auth_controller.dart
│   ├── user_controller.dart
│   ├── timer_controller.dart
├── services/
│   ├── auth_repository.dart
│   ├── user_repository.dart
├── utils/
    ├── debouncer.dart
    ├── constants.dart
```

## State Management

- **Provider**: Used for managing and providing the state throughout the app.

## Lazy Loading

- Implements lazy loading with debouncing for efficient fetching of user details.

## Screenshots

<img src="https://github.com/user-attachments/assets/663674bb-e148-4ba0-9509-4c1ccbf3b2c7" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/e022eeff-f3cd-42ea-b1a1-380328549a1a" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/72c2d725-6964-4de5-997c-6acee2644231" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/d5cecf4b-6e18-471e-8f25-05fcc9e9b4b0" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/37fd6165-1f1d-4572-8963-bb7f85fcf443" alt="" width="300px">


## Setup Instructions

### Prerequisites

- Flutter SDK (>=3.1.0 <4.0.0)

### Installation

1. **Clone the Repository**

   git clone repository link

2. **Install Dependencies**

   flutter pub get

### Contact information

   salmanulfaris4511@gmail.com
   9895840715
