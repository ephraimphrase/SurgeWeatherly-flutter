import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherly/controllers/weather_controller.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});
  final weatherController = Get.put(WeatherController());
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: Get.height / 2.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Container(
                      height: Get.height / 2.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.mapquestapi.com/staticmap/v5/map?key=JmuTeAzzMz5mGmtD46C9HPfLIufVBoVs&center=${weatherController.weatherData.value.lat},${weatherController.weatherData.value.long}&size=600,400@2x'),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter a Location'),
                              controller: textController,
                            ),
                          ),
                          Obx(() => SizedBox(
                                width: Get.width,
                                height: 75,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      weatherController
                                          .getWeather(textController.text);
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF061A36))),
                                    child: Text(
                                      weatherController.button.value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'GTWalsheim',
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Today's Overview",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GTWalsheim',
                          color: Color(0xFF061A36)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.flaky),
                            const Text(
                              'WindSpeed',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF808080),
                                fontFamily: 'GTWalsheim',
                              ),
                            ),
                            Text(
                              '${weatherController.weatherData.value.windSpeed}',
                              style: const TextStyle(
                                  color: Color(0xFF061A36),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )),
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.flaky),
                            const Text('Temperature',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'GTWalsheim',
                                    color: Color(0xFF808080))),
                            Text(
                                '${weatherController.weatherData.value.temperature}',
                                style: const TextStyle(
                                    color: Color(0xFF061A36),
                                    fontSize: 22,
                                    fontFamily: 'GTWalsheim',
                                    fontWeight: FontWeight.w700))
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Color(0xFF808080),
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.flaky),
                            const Text('Humidity',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'GTWalsheim',
                                    color: Color(0xFF808080))),
                            Text(
                                '${weatherController.weatherData.value.humidity}',
                                style: const TextStyle(
                                    color: Color(0xFF061A36),
                                    fontSize: 22,
                                    fontFamily: 'GTWalsheim',
                                    fontWeight: FontWeight.w700))
                          ],
                        )),
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.flaky),
                            const Text('Pressure',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF808080))),
                            Text(
                                '${weatherController.weatherData.value.pressure}',
                                style: const TextStyle(
                                    color: Color(0xFF061A36),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'GTWalsheim'))
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Color(0xFF808080),
                  thickness: 2,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
