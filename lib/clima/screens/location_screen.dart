import 'package:app_brewery_tutorial/clima/screens/city_screen.dart';
import 'package:app_brewery_tutorial/clima/services/weather.dart';
import 'package:app_brewery_tutorial/clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationWeather});
  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  double temperature;
  String cityName;
  int condition;

  String weatherIcon;
  String weatherMessage;
  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = '';
        weatherIcon = '';
        weatherMessage = '';
        return;
      } else {
        final dynamic temp = weatherData['main']['temp'];
        if (temp is int) {
          temperature = temp.toDouble();
        } else {
          temperature = temp as double;
        }

        debugPrint('temperature = $temperature');

        final dynamic cityTemp = weatherData['name'];
        cityName = cityTemp as String;

        final dynamic conditionTemp = weatherData['weather'][0]['id'];
        condition = conditionTemp as int;

        weatherIcon = weatherModel.getWeatherIcon(condition);
        debugPrint('condition = $condition');

        weatherMessage = weatherModel.getMessage(temperature.toInt());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      final weatherData =
                          await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      final typeNamed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );

                      if (typeNamed != null) {
                        final weatherData = await weatherModel
                            .getCityWeather(typeNamed.toString());

                        updateUI(weatherData);

                        debugPrint(typeNamed.toString());
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature.toInt()}°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
