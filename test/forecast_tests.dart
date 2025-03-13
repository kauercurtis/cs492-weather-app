import 'package:test/test.dart';
import 'package:weatherapp/models/forecast.dart';

void main(){
  test("Testing getIconPath()", testIconPath);
  test("Testing toString()", testToString);
  test("Testing getForecasts()", testGetForecasts);
}

void testGetForecasts() async {
  List<Forecast> forecasts = await getForecastHourlyFromPoints(42, -122);
  expect(forecasts.length, 156, reason: "Checking to see if length of returned forecasts is 14");
  expect(forecasts[0].detailedForecast, null);
}

void testIconPath(){
  Forecast forecast = getMockForecast();
  expect(forecast.getIconPath(), "assets/weather_icons/sunny.svg");
}

void testToString(){
  Forecast forecast = getMockForecast();
  String forecastString = forecast.toString();
  expect(forecastString.contains("temperature: 120"), true);
}

Forecast getMockForecast(){
  return Forecast(
    name: "",
    isDaytime: true,
    temperature: 120,
    temperatureUnit: "F",
    windSpeed: "200MPH",
    windDirection: "SSE",
    shortForecast: "SUNNYYYYY!!!!!!!!",
    detailedForecast: "More details about how sunny it is",
    precipitationProbability: 4,
    humidity: 2,
    dewpoint: 5,
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    tempHighLow: null
  );
}