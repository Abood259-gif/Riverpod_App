
without using the keepalive the product removed from the cach when the screen pop:
<img width="513" height="70" alt="image" src="https://github.com/user-attachments/assets/4601b39e-02ca-4551-825f-a05e76843248" />
with keep alive the product does not removed from the cach even if the screen pop
<img width="594" height="53" alt="image" src="https://github.com/user-attachments/assets/48e70eab-9829-4780-a037-0686bd63aed4" />


<img width="968" height="561" alt="image" src="https://github.com/user-attachments/assets/65f67c6d-6b0f-4a72-aeab-fabc153b2ee9" />

For a team of 5 developers, BLoC is the recommended choice.

Here are the key reasons why BLoC excels for teams of this size:

Architectural Consistency: With 5 developers, preventing coding style drift is critical. BLoC enforces a strict contract (Event -> Bloc -> State), ensuring every team member structures features the exact same way and can easily read or maintain anyone else's code.

Streamlined PR Reviews: Reviewing Pull Requests becomes significantly faster because business logic mutations are explicitly tied to searchable Event classes rather than scattered across UI callbacks.

Production Debuggability: Using BlocObserver, your team can track exact user intent alongside state changes (Event -> State), making root-cause analysis for production bugs fast and direct.

Standardized Testing: The bloc_test package provides a uniform template, forcing every developer to write unit tests using the exact same structure without individual experimentation.

When is Riverpod better?
Riverpod is ideal for solo developers or smaller teams (1–2 devs) focused on fast prototyping and low boilerplate. However, for a 5-person team where maintainability, predictability, and shared standards take priority, BLoC is the clear winner.

# 📱 Responsive E-Commerce App

A modern, fully responsive Flutter e-commerce application focusing on clean architecture, performance, and a seamless user experience.

## ✨ Key Features

* 🚀 **Zero `setState`:** State management is handled entirely and cleanly by **Riverpod**.
* 📱 **Responsive UI:** Adapts beautifully to various screen sizes using `LayoutBuilder`.
* ⏳ **Skeleton Loading:** Smooth data-fetching transitions using **Skeletonizer**.
* 🛒 **Dynamic Cart & Filtering:** Fast category filtering and interactive cart management.
* 🧭 **Routing:** Declarative and safe navigation with **GoRouter**.

## 🛠️ Tech Stack

* **Flutter** 
* **Riverpod** (State Management)
* **Skeletonizer** (UI Loading State)
* **GoRouter** (Navigation)

## 🚀 Getting Started

```bash
# Clone the repository
git clone <YOUR_REPO_URL_HERE>

# Get dependencies
flutter pub get

# Run the app
flutter run
