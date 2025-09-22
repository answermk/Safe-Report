# SafeReport

A Real-Time Crime Prevention Platform that uses smart technology to detect and respond to crime instantly, helping keep communities safe through quick alerts and data-driven actions.

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # Main app configuration and navigation
└── screens/
    ├── welcome_screen.dart           # Welcome/Introduction screen
    ├── onboarding_screen_1.dart      # Easy Reporting feature
    ├── onboarding_screen_2.dart      # Community Watch feature
    ├── onboarding_screen_3.dart      # Anonymous & Secure feature
    └── onboarding_screen_4.dart      # Emergency Ready feature
```

## Screens

### 1. Welcome Screen (`welcome_screen.dart`)
- **Purpose**: Introduction to SafeReport app
- **Features**: 
  - App branding and description
  - "Get Started" button
  - Person and smartphone illustration

### 2. Onboarding Screen 1 (`onboarding_screen_1.dart`)
- **Purpose**: Easy Reporting feature introduction
- **Features**:
  - Billboard with "LIVE" display icon
  - "Easy Reporting" title
  - Page indicator (first dot active)
  - "Next" and "Skip Tutorial" buttons

### 3. Onboarding Screen 2 (`onboarding_screen_2.dart`)
- **Purpose**: Community Watch feature introduction
- **Features**:
  - Handshake with people icons
  - "Community Watch" title
  - Page indicator (second dot active)
  - "Next" and "Skip Tutorial" buttons

### 4. Onboarding Screen 3 (`onboarding_screen_3.dart`)
- **Purpose**: Anonymous & Secure feature introduction
- **Features**:
  - Green shield with checkmark icon
  - "Anonymous & Secure" title
  - Page indicator (third dot active)
  - "Next" and "Skip Tutorial" buttons

### 5. Onboarding Screen 4 (`onboarding_screen_4.dart`)
- **Purpose**: Emergency Ready feature introduction
- **Features**:
  - Red emergency siren icon with radiating lines
  - "Emergency Ready" title
  - Page indicator (fourth dot active)
  - "Next" and "Get Started" buttons

## Design Features

- **Color Scheme**: Primary blue (#1E3A8A) with white backgrounds
- **Typography**: Clean, modern fonts with proper hierarchy
- **Layout**: Curved headers and consistent spacing
- **Navigation**: Smooth page transitions with PageView
- **Responsive**: Adapts to different screen sizes

## Getting Started

1. Ensure you have Flutter installed
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Navigation Flow

1. Welcome Screen → Onboarding Screen 1
2. Onboarding Screen 1 → Onboarding Screen 2
3. Onboarding Screen 2 → Onboarding Screen 3
4. Onboarding Screen 3 → Onboarding Screen 4
5. Onboarding Screen 4 → Main App (to be implemented)

Users can skip the tutorial at any point to go directly to the main app.
