import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';


class InteractiveGlobe extends StatelessWidget {
  bool? isRotate; // Variable to control rotation
  InteractiveGlobe({required this.isRotate});

  @override
  Widget build(BuildContext context) {
    bool? _isRotating = isRotate; // Assign the rotation value to a local variable

    return ModelViewer( // Render a 3D model viewer
      src: 'assets/earth.glb', // Source of the 3D model (local asset)
      alt: 'Earth Model',
      ar: false,
      autoRotate: _isRotating,
      autoPlay: _isRotating,
      disableZoom: true,
    );
  }
}
