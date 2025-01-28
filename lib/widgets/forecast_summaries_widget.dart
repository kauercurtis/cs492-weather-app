import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/forecast.dart' as forecast;
import 'package:weatherapp/scripts/forecast.dart' as forecastSummary;

class ForecastSummaryWidget extends StatelessWidget {
  const ForecastSummaryWidget({
    super.key,
    required List<forecast.Forecast> forecasts, required forecast.Forecast currentForecast,
  }) : _forecasts = forecasts;

  final List<forecast.Forecast> _forecasts;

  @override
  Widget build(BuildContext context) {
    List<ForecastSummaryWidget> summaries = [];
    for(int i = 0; i < _forecasts.length; i++){
      summaries.add(ForecastSummaryWidget(currentForecast: _forecasts[i], forecasts: _forecasts,));
    }
    return Row(
      children: [
        ...summaries,
      ],
    );
  }


}
