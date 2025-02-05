import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/forecast.dart' as forecast;
import 'package:weatherapp/widgets/forecast_summary_widget.dart';


class ForecastSummariesWidget extends StatelessWidget {
  const ForecastSummariesWidget({
    super.key,
    required List<forecast.Forecast> forecasts,
    required Function setActiveForecast,
  }) : _forecasts = forecasts, _setActiveForecast = setActiveForecast;

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
}

class onTapSummaryWidget extends StatelessWidget {
  const onTapSummaryWidget({
    super.key,
    required List<forecast.Forecast> forecasts,
    required this.i,
    required Function setActiveForecast,
  }) : _forecasts = forecasts, _setActiveForecast = setActiveForecast;

  final List<forecast.Forecast> _forecasts;
  final int i;
  final Function _setActiveForecast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {_setActiveForecast(i);}, child: ForecastSummaryWidget(currentForecast: _forecasts[i]));
  }
}

class OnTapSummaryWidget extends StatelessWidget {
  const OnTapSummaryWidget({
    super.key,
    required List<forecast.Forecast> forecasts,
    required this.i,
    required Function setActiveForecast
  }) : _forecasts = forecasts, _setActiveForecast = setActiveForecast;

  final List<forecast.Forecast> _forecasts;
  final int i;
  final Function _setActiveForecast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {_setActiveForecast(i);}, child: ForecastSummaryWidget(currentForecast: _forecasts[i]));
  }
}