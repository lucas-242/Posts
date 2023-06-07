import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:reddit_posts/core/themes/themes.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
    required this.camera,
    required this.takePictureCallback,
  });

  final CameraDescription camera;
  final Function(XFile) takePictureCallback;

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    final image = await _controller.takePicture();
    widget.takePictureCallback(image);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: <Widget>[
              CameraPreview(
                _controller,
                // child: Material(
                //   child: SizedBox(
                //     width: 48,
                //     height: 48,
                //     child: IconButton(
                //       onPressed: () async {
                //         // Take the Picture in a try / catch block. If anything goes wrong,
                //         // catch the error.
                //         try {
                //           // Attempt to take a picture and then get the location
                //           // where the image file is saved.
                //           await _initializeControllerFuture;
                //           final image = await _controller.takePicture();
                //         } catch (e) {
                //           print(e);
                //         }
                //       },
                //       icon: const Icon(Icons.camera_alt),
                //     ),
                //   ),
                // ),
              ),
              AppSizeConstants.largeVerticalSpacer,
              Center(
                child: FloatingActionButton(
                  elevation: 2,
                  onPressed: _takePicture,
                  backgroundColor: AppColors.white,
                  child: const Icon(
                    Icons.camera_alt,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
