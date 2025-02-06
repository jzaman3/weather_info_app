import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  const WeatherInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: const Color.fromARGB(255, 131, 28, 172).fromARGB(255, 99, 211, 166),
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String cityName = '';
  String temperature = '';
  String condition = '';

  void fetchWeather() {
    // Simulate fetching weather data
    setState(() {
      cityName = 'New York'; // Replace with user input
      temperature = '${20 + (DateTime.now().second % 15)}°C'; // Random temperature
      condition = ['Sunny', 'Cloudy', 'Rainy'][DateTime.now().second % 3]; // Random condition
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  cityName = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Button to fetch weather data
            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),

            // Display weather information
            Text(
              'City: $cityName',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Temperature: $temperature',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Condition: $condition',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}