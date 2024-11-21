[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gr1n1Q-B)
# DMIT2504 Assignment 02 - Flutter Widgets and Gestures

**Weight:** 10% of final mark

**Submission requirements:** On or before the deadline, push your final solution to the GitHub repository. **You must commit and push to the classroom assignment repository supplied for the assignment**; do not create your own repository. It is your responsibility to ensure that your work is in the correct repository. **_Work not in the repository will not be graded_**.

## Current Weather App UI

This assignment will build off the previous one and put your [OpenWeather](https://openweathermap.org/) library to use. You will design and build a simple UI for displaying the current weather for a hard-coded location. For some inspriation, you can run a [Google search for 'current weather app ui'](https://www.google.com/search?q=current+weather+app+ui) and select the 'Images' tab from the top nav on the results page. The [Dribbble](https://dribbble.com/tags/weather-app) site also has many open license options for inspiration.

This project shell contains a `lib/services/` directory with a `static_weather.dart` file. This file exposes a `getStaticWeatherForCity(city)` function that can be used to develop the app if you do not have a functioning weather API library. There is also a default `current_weather.dart` file provided in the `models/` directory for you to use if you don't have a functioning CurrentWeather class. Note, the CurrentWeather class performs no validation on any fields. Use the automated tests as a guide while building your solution (`$ flutter test -r expanded automated_tests_do_not_touch`).

The requirements for the app are presented below.

1. Create a `CurrentWeatherView` Widget

- Create this widget in the `lib/pages/` directory (you will also need to create the `pages/` directory).
- This widget must be implemented as a StatefulWidget (to support the fetching and rendering of current weather data).
- This widget will act as the main home page of the app.
- This widget must accept a single named param `weatherProvider`.
  - The `weatherProvider` param must be an async function that accepts a String `city` named param and returns a `Future<CurrentWeather>` object when called.
  - A default function, `_currentWeatherProvider({city})`, has been created for you to use in the `main.dart` file (replace the implementation with your own weather library API function and CurrentWeather class if they are operational).
- This widget must create an instance of `CurrentWeather` (i.e. call the `weatherProvider` param) when first initialized to be used by this and other widgets for display of the current weather.
- This widget must display the city name for the current weather in a `Text` widget.
- This widget must display the description for the current weather in a `Text` widget.
- This widget must render a `CurrentTemp` widget (see below).
- This widget must render a button (use one of `TextButton`, `ElevatedButton`, or `OutlinedButton`) that when pressed will refresh the current weather data (e.g. make a call to `weatherProvider`).
- This widget must render at least one local asset image.

2. Create a `CurrentTemp` Widget

- Create this widget in the `lib/widgets/` directory (you will also need to create the `widgets/` directory).
- This widget must be implemented as a StatelessWidget.
- This widget must accept two named params: `date` (a date time value) and `temperature` (a double value); both params are required.
- This widget must display the current time and the current temperature.
  - The date must be displayed in `Today, MMM d yyyy h:mm a` format, where 'MMM' is the short month name (e.g. Aug), 'd' is the day number (e.g. 1, 5, 11, etc.), 'yyyy' is the full year (e.g. 2024), 'h' is the hour (e.g. 1, 5, 11, etc.), 'mm' is the minute (e.g. 01, 05, 11, etc.), and 'a' is either 'AM' or 'PM'.
  - NOTE: for formatting dates and times, you may want to use the [DateFormat class](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html) package.
  - The current temperature must be displayed in `N°C` format, where 'N' is the current temperture, in degrees Celsius, rounded to the nearest degree.

3. Create a `Daylight` Widget

- Create this widget in the `lib/widgets/` directory.
- This widget must be implemented as a StatefulWidget (to support the toggle of the daylight hours widget).
- This widget must accept two named params: `sunrise` (a date time value) and `sunset` (a date time value); both params are required.
- This widget must display the sunrise for the current weather in a `Text` widget in `h:mm a` format, where 'h' is the hour (e.g. 1, 5, 11, etc.), 'mm' is the minute (e.g. 01, 05, 11, etc.), and 'a' is either 'AM' or 'PM'.
- This widget must display the sunset name for the current weather in a `Text` widget in `h:mm a` format, where 'h' is the hour (e.g. 1, 5, 11, etc.), 'mm' is the minute (e.g. 01, 05, 11, etc.), and 'a' is either 'AM' or 'PM'.
- When tapped, this widget must toggle the display of the total hours and minutes of daylight for the current day in `Daylight: h hours and m minutes`, where `'h' is the number of hours (e.g. 1, 5, 11, etc.), 'm' is the number of minutes (e.g. 1, 5, 11, etc.)`.
  - The total daylight hours and minutes must be rendered in a `Text` widget.

4. Application Theme and Style

- The application must make use of custom styles and themeing
- You are free to style and theme the application any way you like, but at a minimum the application must demonstrate the following:
  - Customized default widget display (e.g. change the size, shape, borders, etc. of a widget)
  - Customized theme colors
- Include an additional `STYLE.txt` file in the root of your project in which you must detail how you have implemented the style and theme requirements.

## Submission Requirements

Be sure to follow the rules and conventions of the Dart programming language. See [Effective Dart](https://dart.dev/effective-dart) for details. Your code must compile and not throw any unexpected runtime exceptions. **Code that does not compile will not be graded.** Your code must be committed and pushed to the GitHub classroom assignment repository before the deadline. **Any code pushed to the repository after the deadline will not be graded.** If you require clarification or have any questions about the assignment requirements, be sure to contact your instructor as soon as possible. Use the provided automated tests (`$ flutter test automated_tests_do_not_touch`) and built-in analyzer (`$ dart analyze ./lib`) to check your current work status as you progress on your assignment. The formatting of your code, analysis of your code, and automated tests will all be checked when you push to your assignment repository. **Apps that do not run for any reason will not be graded.**

## Marking Rubrics [Assignment total 10]

### CurrentWeatherView Widget [4]

| Mark | Description                                                                                                                                                                                                         |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 5    | Excellent – widget passes all test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; coding follows best practices and class standards             |
| 4    | Very Good – widget passes all test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; but coding does not follow best practices and class standards |
| 3    | Acceptable – widget passes most test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; coding may not follow best practices and class standards    |
| 2    | Needs Work – widget passes very few, or even just one, test case; may be used incorrectly in the mobile application; may cause application to crash; coding may not follow best practices and class standards      |
| 1    | Unsatisfactory – widget passes none of the test cases; code does not meet any of the requirements (some code has been submitted, but does not demonstrate the majority of the requirements)                        |
| 0    | Not done or the program does not compile                                                                                                                                                                            |

### Daylight Widget [3]

| Mark | Description                                                                                                                                                                                                         |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 5    | Excellent – widget passes all test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; coding follows best practices and class standards             |
| 4    | Very Good – widget passes all test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; but coding does not follow best practices and class standards |
| 3    | Acceptable – widget passes most test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; coding may not follow best practices and class standards    |
| 2    | Needs Work – widget passes very few, or even just one, test case; may be used incorrectly in the mobile application; may cause application to crash; coding may not follow best practices and class standards      |
| 1    | Unsatisfactory – widget passes none of the test cases; code does not meet any of the requirements (some code has been submitted, but does not demonstrate the majority of the requirements)                        |
| 0    | Not done or the program does not compile                                                                                                                                                                            |

### CurrentTemp Widget [2]

| Mark | Description                                                                                                                                                                                                         |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 5    | Excellent – widget passes all test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; coding follows best practices and class standards             |
| 4    | Very Good – widget passes all test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; but coding does not follow best practices and class standards |
| 3    | Acceptable – widget passes most test cases; is used correctly in the mobile application; the mobile application does not crash because of this widget; coding may not follow best practices and class standards    |
| 2    | Needs Work – widget passes very few, or even just one, test case; may be used incorrectly in the mobile application; may cause application to crash; coding may not follow best practices and class standards      |
| 1    | Unsatisfactory – widget passes none of the test cases; code does not meet any of the requirements (some code has been submitted, but does not demonstrate the majority of the requirements)                        |
| 0    | Not done or the program does not compile                                                                                                                                                                            |

### Application Theme and Style [1]

| Mark | Description                                                                                                                                                                                                                  |
| ---- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 5    | Acceptable – Application demonstrates both customized theme elements (three or more custom settings altered/set) and at least one widget has been customized (three or more customizations made)                            |
| 2.5  | Needs Work – Application demonstrates only one of a customized application theme or at least one customized widget                                                                                                          |
| 0    | Incomplete - Application in no way demonstrates any theme or widget customization, or fails to meet the requirements of both theme and custom style (e.g. changing the size of Text and setting a single theme color option) |
