import './forecast.dart' as forecast;

Future<void> main() async {
  
  List<List<double>> coordinates = [];
  coordinates.add([25.7752, -80.2086]);
  coordinates.add([25.9991, -97.4550]);
  coordinates.add([26.0791, -80.2850]);
  coordinates.add([26.1412, -80.1467]);
  coordinates.add([26.6432, -81.9974]);
  // testing with Bend, OR coordinates
  // double lat = 44.05;
  // double lon = -121.31;
  // TODO: Seach for latitutes and longitudes of 5 cities in the US on the internet
  // Create a for loop that will generate forecasts arrays for each city
  // TODO: create forecasts and forecastsHourly both of type List<forecast.Forecast>
  
  for(var coordinate in coordinates){
    List forecastObjects = await forecast.getForecastFromPoints(coordinate[0], coordinate[1]);
    List hourlyForecastObjects = await forecast.getForecastHourlyFromPoints(coordinate[0], coordinate[1]);  
  }

  // forecast.getForecastFromPoints(lat, lon);
  // forecast.getForecastHourlyFromPoints(lat,lon);
}