import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:irrigratron_5000/unity_widget_page.dart';
import 'package:irrigratron_5000/widgets/add_data_points.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Irrigatron 5000',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Irrigatron 5000'),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Plantinha',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Stack(children: [
                Image(
                  image: AssetImage('assets/images/plantinha.jpg'),
                  height: 200,
                  width: 200,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const unityWidgetPage()),
                        );
                      },
                      child: Icon(
                        Icons.fullscreen,
                        size: 40,
                      )),
                )
              ]),
              Row(
                children: [
                  Icon(
                    Icons.waves,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SizedBox(width: 100, child: Text('Level da água')),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: GFProgressBar(
                    percentage: 0.8,
                    backgroundColor: Colors.lightBlue.shade100,
                    progressBarColor: Colors.blue,
                    lineHeight: 10,
                  ))
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.thermostat,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SizedBox(width: 100, child: Text('Temperatura')),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: GFProgressBar(
                    percentage: 0.6,
                    backgroundColor: Colors.red.shade100,
                    progressBarColor: Colors.red,
                    lineHeight: 10,
                  ))
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.water_drop,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SizedBox(width: 100, child: Text('Umidade')),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: GFProgressBar(
                    percentage: 0.4,
                    backgroundColor: Colors.blue.shade100,
                    progressBarColor: Colors.blue,
                    lineHeight: 10,
                  ))
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.speed,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SizedBox(width: 100, child: Text('pH')),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: GFProgressBar(
                    percentage: 0.6,
                    backgroundColor: Colors.yellow.shade100,
                    progressBarColor: Colors.yellow,
                    lineHeight: 10,
                  ))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Umidade ao longo do tempo",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(child: AddDataPoints(Key('teste'))),
            ],
          )),
    );
  }
}
