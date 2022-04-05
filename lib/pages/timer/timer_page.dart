// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shorten_my_shower/components/app_bar.dart';
// import 'package:shorten_my_shower/constant.dart';
// import 'package:shorten_my_shower/controllers/controller.dart';
// import 'package:shorten_my_shower/controllers/menu_controller.dart';

import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              color: Colors.blue[200],
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              height: 100,
                              alignment: Alignment.topCenter,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Shorten My Shower".toUpperCase(),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                //color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: Text("Home")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue[300],
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/timer');
                                  },
                                  child: Text("Timer")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {},
                                  child: Text("Estimation")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {},
                                  child: Text("Refletion")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {},
                                  child: Text("Login")),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(
              child: BodyTimerPage(),
            )
          ],
        ),
      ),
    );
  }
}

class BodyTimerPage extends StatefulWidget {
  const BodyTimerPage({Key? key}) : super(key: key);

  @override
  _BodyTimerPageState createState() => _BodyTimerPageState();
}

class _BodyTimerPageState extends State<BodyTimerPage> {
  //
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimer();
    reset();
  }

  void reset() {
    setState(() {
      duration = Duration();
      timer?.cancel();
    });
  }

  void addTime() {
    final addSecond = 1;
    setState(() {
      final second = duration.inSeconds + addSecond;

      if (second > 3600) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: second);
      }
    });
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.blue[100],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // CustomAppBar(),
          // Obx(() => Row(children: [
          //       Container(
          //           padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
          //           child: Text(menuController.activeItem.value,
          //               style: TextStyle(
          //                   fontSize: 24, fontWeight: FontWeight.bold)))
          //     ])),
          Center(
            child: Column(
              children: [
                buildIcons(),
                buildTime(),
                SizedBox(
                  height: 24.0,
                ),
                buildButtons(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _starsForRatings()),
                buildReport(),
                buildTimerData(duration.inSeconds.toString())
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildTimerData(String timedata) {
    return Text(timedata);
  }

  Widget buildReport() {
    return ElevatedButton(
      child: Text("Get A report"),
      onPressed: () {
        // navigate to new page and pass the record time
        print('${duration.inSeconds} second passing to report');
      },
    );
  }

  //
  List<Icon> _starsForRatings() {
    List<Icon> stars = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < duration.inSeconds.remainder(60); i++) {
      stars.add(Icon(
        Icons.water_drop,
        color: Colors.blue[300],
        size: 80,
      ));
    }
    return stars;
  }

  Widget buildIcons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return isRunning || !isCompleted
        ? Image.asset('images/icons8-rain.gif', width: 60.0, height: 60.0)
        : Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.cloud,
              size: 50,
            ),
          );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: isRunning
                    ? Text(
                        "Stop",
                        style: TextStyle(color: Colors.redAccent),
                      )
                    : Text(
                        "Resume",
                        style: TextStyle(color: Colors.black),
                      ),
                onPressed: () {
                  if (isRunning) {
                    stopTimer(resets: false);
                  } else {
                    startTimer(resets: false);
                  }
                },
              ),
              ElevatedButton(
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.redAccent),
                ),
                onPressed: () {
                  reset();
                },
              ),
            ],
          )
        : ElevatedButton(
            child: Text("Start"),
            onPressed: () {
              startTimer();
            },
          );
  }

  //
  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));

    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: minutes, header: "Minutes"),
        const SizedBox(
          width: 8.0,
        ),
        buildTimeCard(time: seconds, header: "Seconds"),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 24.0,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 72.0,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(header),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shorten_my_shower/components/app_bar.dart';
// import 'package:shorten_my_shower/pages/home/components/body.dart';

// class TimerPage extends StatelessWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       key: scaffoldKey,
//       body: Container(
//         height: size.height,
//         width: size.width,
//         // decoration: BoxDecoration(
//         //   image: DecorationImage(
//         //       image: AssetImage("assets/images/background.jpg"),
//         //       fit: BoxFit.cover),
//         // ),
//         child: Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(50.0),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               "assets/images/logo.png",
//                               height: 100,
//                               alignment: Alignment.topCenter,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               "Shorten My Shower".toUpperCase(),
//                               style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 //color: kPrimaryColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       //
//                       Container(
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.blue[300],
//                                       onPrimary: Colors.black,
//                                       fixedSize: Size(100, 60),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                   onPressed: () {},
//                                   child: Text("Home")),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                       onPrimary: Colors.black,
//                                       fixedSize: Size(100, 60),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                   onPressed: () {
//                                     Navigator.pushNamed(context, '/search');
//                                   },
//                                   child: Text("Timer")),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                       onPrimary: Colors.black,
//                                       fixedSize: Size(100, 60),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                   onPressed: () {},
//                                   child: Text("Estimation")),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                       onPrimary: Colors.black,
//                                       fixedSize: Size(100, 60),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                   onPressed: () {},
//                                   child: Text("Refletion")),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                       onPrimary: Colors.black,
//                                       fixedSize: Size(100, 60),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                   onPressed: () {},
//                                   child: Text("Login")),
//                             ),
//                           ],
//                         ),
//                       )
//                     ]),
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//               //
//               Spacer(),

//               Body(),

//               Spacer(
//                 flex: 2,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
