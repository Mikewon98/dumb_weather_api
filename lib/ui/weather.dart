import 'package:flutter/material.dart';
import 'package:my_weather_app/client/client.dart';
import 'package:my_weather_app/model/model.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherModel? weatherModel;
  List<Widget>? hourlyCast;
  List<Widget>? hourlyCastTime;
  List<dynamic>? hourlyTemp;
  List<dynamic>? hourlyDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Current weather",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Icon(
                  Icons.sunny,
                  color: Colors.amber,
                  size: 64,
                ),
                const SizedBox(height: 20),
                Text(
                  '${weatherModel?.currentWeather["temperature"] ?? 0}C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    weatherModel = await WeatherApiCLient().request();
                    hourlyTemp = weatherModel?.hourly["temperature_2m"];
                    hourlyDate = weatherModel?.hourly["time"];
                    hourlyCast = hourlyTemp
                        ?.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              '$e',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                        .toList();

                    hourlyCastTime = hourlyDate
                        ?.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              '$e',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList();
                    setState(() {});
                  },
                  child: const Text("Get data"),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: hourlyCastTime == null
                            ? [const Text("empty")]
                            : hourlyCastTime!,
                      ),
                      Column(
                        children: hourlyCast == null
                            ? [const Text("empty")]
                            : hourlyCast!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
