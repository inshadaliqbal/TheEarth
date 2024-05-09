import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';


class InteractiveGlobe extends StatelessWidget {
  bool? isRotate;
  InteractiveGlobe({required this.isRotate});

  @override
  Widget build(BuildContext context) {
    bool? _isRotating = isRotate;
    return //The 3D viewer widget
      ModelViewer(
        src: 'assets/earth.glb',
        alt: 'Earth Model',
        ar: false,
        autoRotate: _isRotating,
        autoPlay: _isRotating,
        iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
        disableZoom: true,

      );
  }
}

