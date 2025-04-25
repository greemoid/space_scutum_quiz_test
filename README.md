# 📱 Quiz App

**⬇️ Demo Video**  


## 🧠 About

This is a simple quiz app made for a Flutter test task.  
It asks users a few questions and shows the result at the end.

## ✅ Features

- A screen with questions and answer choices  
- Tap an answer to go to the next question  
- Final screen shows how many answers were correct  
- Smooth animations between questions  
- A screen to see results from old quizzes  
- Data is saved using objectbox

## 🧪 Tests

- Unit tests  
- BLoC tests for logic
- Important parts of the app is covered

## 🧰 Tech Used

- **Flutter**  
- **flutter_bloc** for state management  
- **objectbox** for database  
  (I chose objectbox because I’ve already worked with hive, drift, isar, and sqflite before)
- **freezed** for DAOs
- **flutter_animate** for animations (built in animations in some cases)
- Quiz is loaded from JSON file in the assets


## 📂 How to Run

1. Clone the repo `https://github.com/greemoid/space_scutum_quiz_test.git`
2. Run `flutter pub get`
3. Run `dart run build_runner build`
4. Run the app using `flutter run` (linux and android tested ✅)