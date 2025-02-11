import 'package:flutter/material.dart';

import 'package:weatherapp/scripts/location.dart' as location;
import 'package:weatherapp/scripts/forecast.dart' as forecast;
import 'package:weatherapp/scripts/time.dart' as time;
import 'package:weatherapp/widgets/forecast_tab_widget.dart';
import 'package:weatherapp/widgets/location_tab_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = 'CS492 Weather App';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<forecast.Forecast> _forecastsHourly = [];
  List<forecast.Forecast> _filteredForecastsHourly= [];
  List<forecast.Forecast> _forecasts = [];
  List<forecast.Forecast> _dailyForecasts = [];
  forecast.Forecast? _activeForecast;
  location.Location? _location;

  @override
  void initState() {
    super.initState();
    if (_location == null){
      setLocation();
    }
  }

  Future<List<forecast.Forecast>> getForecasts(location.Location currentLocation) async {
    return forecast.getForecastFromPoints(currentLocation.latitude, currentLocation.longitude);
  }


  Future<List<forecast.Forecast>> getHourlyForecasts(location.Location currentLocation) async {
    return forecast.getForecastHourlyFromPoints(currentLocation.latitude, currentLocation.longitude);
  }

<<<<<<< HEAD
  void setLocation() async {
    if (_location == null){
      location.Location currentLocation = await location.getLocationFromGps();

      List<forecast.Forecast> currentHourlyForecasts = await getHourlyForecasts(currentLocation);
      List<forecast.Forecast> currentForecasts = await getForecasts(currentLocation);

      setState(() {
        _location = currentLocation;
        _forecastsHourly = currentHourlyForecasts;
        _forecasts = currentForecasts;
        setDailyForecasts();
        _filteredForecastsHourly = getFilteredForecasts(0);
        _activeForecast = _forecastsHourly[0];
        
        
      });
=======
  void setActiveForecast(int i){
    setState(() {
      _filteredForecastsHourly = getFilteredForecasts(i);
      _activeForecast = _dailyForecasts[i];
    });
  }

  void setActiveHourlyForecast(int i){
    setState(() {
      _activeForecast = _filteredForecastsHourly[i];
    });
  }

  void setDailyForecasts(){
    List<forecast.Forecast> dailyForecasts = [];
    for (int i = 0; i < _forecasts.length-1; i+=2){
      dailyForecasts.add(forecast.getForecastDaily(_forecasts[i], _forecasts[i+1]));
      
    }
    setState(() {
      _dailyForecasts = dailyForecasts;
    });
  }

  List<forecast.Forecast> getFilteredForecasts(int i){
    return _forecastsHourly.where((f)=>time.equalDates(f.startTime, _dailyForecasts[i].startTime)).toList();
  }

  void setLocation([List<String>? locationList]) async {
    setState(() {
      _location = null;
    });
    location.Location currentLocation;
    if (locationList == null){
      currentLocation = await location.getLocationFromGps();
>>>>>>> d0640a235e90cbb69b653615c04f1fd0d6798993
    }
    else {
      currentLocation = await location.getLocationFromAddress(locationList[0], locationList[1], locationList[2]) as location.Location;
    }

    List<forecast.Forecast> currentHourlyForecasts = await getHourlyForecasts(currentLocation);
    List<forecast.Forecast> currentForecasts = await getForecasts(currentLocation);

    setState(() {
      _location = currentLocation;
      _forecastsHourly = currentHourlyForecasts;
      _forecasts = currentForecasts;
      setDailyForecasts();
      _filteredForecastsHourly = getFilteredForecasts(0);
      _activeForecast = _forecastsHourly[0];
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: Column(
            children: [
              LocationWidget(location: _location),
              _activeForecast != null ? ForecastWidget(forecast: _activeForecast!) : Text(""),
              _forecasts.isNotEmpty ? ForecastSummariesWidget(forecasts: _forecasts) : Text("")
            ],
          ),
=======
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.sunny_snowing)),
              Tab(icon: Icon(Icons.edit_location_alt))
            ]
          )
        ),
        body:TabBarView(
          children: [ForecastTabWidget(
            activeLocation: _location, 
            activeForecast: _activeForecast,
            dailyForecasts: _dailyForecasts,
            filteredForecastsHourly: _filteredForecastsHourly,
            setActiveForecast: setActiveForecast,
            setActiveHourlyForecast: setActiveHourlyForecast),
          LocationTabWidget(setLocation: setLocation, activeLocation: _location)]
>>>>>>> d0640a235e90cbb69b653615c04f1fd0d6798993
        ),
      ),
    );
  }
}