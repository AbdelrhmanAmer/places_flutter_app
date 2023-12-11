import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelectImage});

  final void Function(File image) onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
    File? _selectedImage;

  _takePicture()async{
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
    );
    if(pickedImage == null) {
      print('null image');
      return ;}

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.onSelectImage(_selectedImage!);
  }
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
        onPressed: _takePicture,
        label: const Text('Take Picture'),
        icon: const Icon(Icons.camera)
    );

    if(_selectedImage != null){
      setState(() {
        content = GestureDetector(
          onTap: _takePicture,
          child: Image.file(
            _selectedImage!,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        );
      });
    }
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
      child: content
    );
  }
}
