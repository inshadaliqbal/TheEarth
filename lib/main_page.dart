import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/provider_engine.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'continent_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool rotation = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<MainEngine>(context).getAPIData();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.jpg'), fit: BoxFit.fill)),
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'THE EARTH',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Solar System 70% N2',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.white38,
                    // child: InteractiveGlobe(isRotate: rotation,),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.tealAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Adjust the value as needed
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Continent();
                        },
                      ),
                    );
                    setState(() {
                      rotation = false;
                    });
                  },
                  child: Text(
                    'Visit Earth',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w400,
                    ),
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
class InteractiveGlobe extends StatefulWidget {
  bool? isRotate;
  InteractiveGlobe({required this.isRotate});

  @override
  State<InteractiveGlobe> createState() => _InteractiveGlobeState();
}

class _InteractiveGlobeState extends State<InteractiveGlobe> {
  @override
  Widget build(BuildContext context) {
    bool? _isRotating = widget.isRotate;
    print(_isRotating);
    return //The 3D viewer widget
        ModelViewer(
      // backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
      src: 'assets/earth.glb',
      alt: 'A 3D model of an astronaut',
      ar: true,
      autoRotate: _isRotating,
      autoPlay: _isRotating,
      iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
      disableZoom: true,

    );
  }
}

