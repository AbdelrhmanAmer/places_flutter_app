import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageInput extends StatefulWidget {
  const ImageInput({super.key});


  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  _takePicture(){

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(.2),
          width: 1
        )
      ),
      alignment: Alignment.center,
      child: TextButton.icon(
          onPressed: _takePicture,
          label: const Text('Take Picture'),
          icon: const Icon(Icons.camera)
      ),
    );
  }
}
