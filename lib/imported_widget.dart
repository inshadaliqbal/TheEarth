import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';


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

