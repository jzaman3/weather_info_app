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
        primarySwatch: Colors.blue,
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
  List<Map<String, String>> forecast = [];

  void fetchWeather() {
    setState(() {
      cityName = 'Georgia';  
      forecast = List.generate(7, (index) {
        return {
          'day': 'Day ${index + 1}',
          'temperature': '${20 + (DateTime.now().second % 15) - index}°C',
          'condition': ['Sunny', 'Cloudy', 'Rainy'][index % 3]
        };
      });
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

            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),

            Text(
              'City: $cityName',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // 7-day forecast list
            Expanded(
              child: ListView.builder(
                itemCount: forecast.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        forecast[index]['condition'] == 'Sunny'
                            ? Icons.wb_sunny
                            : forecast[index]['condition'] == 'Cloudy'
                                ? Icons.wb_cloudy
                                : Icons.beach_access,
                        color: Colors.orange,
                      ),
                      title: Text(
                        forecast[index]['day']!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Temperature: ${forecast[index]['temperature']}, '
                        'Condition: ${forecast[index]['condition']}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
