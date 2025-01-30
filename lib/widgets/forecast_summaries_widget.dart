import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/forecast.dart' as forecast;
<<<<<<< HEAD
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


=======
import 'package:weatherapp/widgets/forecast_summary_widget.dart';


class ForecastSummariesWidget extends StatelessWidget {
  const ForecastSummariesWidget({
    super.key,
    required List<forecast.Forecast> forecasts,
  }) : _forecasts = forecasts;

  final List<forecast.Forecast> _forecasts;
  
  List<ForecastSummaryWidget> getForecastWidgets(){
    List<ForecastSummaryWidget> widgets = [];

    for (int i = 0; i < _forecasts.length; i++){
      widgets.add(ForecastSummaryWidget(currentForecast: _forecasts[0]));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: getForecastWidgets()));
  }
>>>>>>> d460ee6d8a4cd1b7212eed30ad6f41883c24cf16
}
