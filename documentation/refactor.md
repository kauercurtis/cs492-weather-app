# Project Name: CS492 Weather App
## Project Name: CS492 Weather App
### Refactor Date: 2/20/2025
### Refactorers: Alex (programmer), Curtis (documentator)

#### Widgets

* `Organized the widgets into subfolders based on relation to location or forecast`

* `Organized the location widgets in location_tab_widet.dart into their own files`

* `Organized the forecast widgets in forecase_summary_widget.dart into their own files`

* `Extracted all the forecast summary widets into their own files`

* `Combined the forecastNameWidgets into a single widget with styling passed as a argument`

* `ForecastSummaryWidet and ForecastWidget updated to pass in a styling argument to forecastNameWidgets`

* `Got rid of the ShortForecastWidget`

* `Extracted ForecaseWidet into it's own file`

* `Extracted OnTapSummary into it's own file`

#### Across Entire Codebase

* `Reformated file paths`

* `Fixed spacing of the imports`

* `Cleaned up unused references`

#### Scripts

* `Extracted location.dart and forecast.dart into new folder, models`

* `Deleted tests.dart`

* `Removed location_storage.dart`

#### main.dart

* `Extracted MyApp and MyHomePage into their own files to follow Bakos convention`

* `Renamed MyApp to App and MyHomePage to HomePage to follow Bakos convention`

* `Moved App and MyHomePage to widgets folder`

#### Test

* `Deleted test folder`