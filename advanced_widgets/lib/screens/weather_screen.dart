import 'package:flutter/material.dart';
import 'dart:math';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with TickerProviderStateMixin {
  bool visible = false;
  int cnt = 0;
  List<List<Color>> gradientColors = [
    [
    Color(0xff1f005c),
    Color(0xff5b0060),
    ],
    [
    Color(0xff870160),
    Color(0xffac255e),
    ],
    [
    Color(0xffca485c),
    Color(0xffe16b5c),
    ],
    [
    Color(0xfff39060),
    Color(0xffffb56b),
    ]
  ];
  List<String> weatherData = [
    'Солнечно, 25 градусов',
    'Тепло, 18 градусов',
    'Облачно, 12 градусов',
    'Дождливо, 3 градуса',
  ];
  List<String> weatherState = [
    'assets/images/sun.png',
    'assets/images/cloudy_2.png',
    'assets/images/cloudy.png',
    'assets/images/heavy-rain.png',
  ];
  int rand = Random().nextInt(4);
  late AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this
  )..repeat(reverse: true);
  late AnimationController _controller1;
  double _iconSize = 80.0;
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller, 
    curve: Curves.easeIn,
  );

    @override
    void initState() {
      super.initState();
      _controller1 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      );
    }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

    void _resizeIcon() {
    if (_iconSize == 80.0) {
      _controller1.forward();
      // _iconSize = 300.0;
      _iconSize = MediaQuery.of(context).size.width;
      visible = true;
      setState(() {});
    } else {
      _controller1.reverse();
      _iconSize = 80.0;
      visible = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final Size biggest = constraints.biggest;
            return Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors[cnt],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
            ),
              child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 40
                    ),
                    child: ElevatedButton(onPressed: () {
                      setState(() {
                        if (cnt == 3) {
                          cnt = 0;
                        } else {
                          cnt++;
                        }
                      });
                    }, 
                    child: Text('Switch')),
                  ),
                ),
                  
                Column(
                  children: [
                
                    // Weather state
                    GestureDetector(
                      onTap: _resizeIcon,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                          right: 30,
                          left: 30
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: _iconSize,
                            height: _iconSize,
                            child: Image.asset(
                              '${weatherState[cnt]}',
                            ),
                          ),
                        ),
                      ),
                    ),
                
                    // Weather data
                    visible ? FadeTransition(
                      opacity: _animation,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)
                        ),
                        child: Text(
                          '${weatherData[cnt]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05
                          ),
                        ),
                      ),
                    ) : Container(),
                  ],
                ),
              ],
                        ),
            );
          }
        ),
      ),
    );
  }
}