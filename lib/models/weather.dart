class Weather {
  final double windSpeed;
  final int pressure;
  final int humidity;
  final double temperature;
  final double long;
  final double lat;

  Weather(
    {
      required this.windSpeed,
      required this.pressure,
      required this.humidity,
      required this.temperature,
      required this.long,
      required this.lat
    }
  );
}