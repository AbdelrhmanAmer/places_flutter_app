import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places_app/providers/user_places_provider.dart';
import 'package:places_app/widgets/image_input.dart';

import '../widgets/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  late File? _selectedImage;

  void _savePlace(){
    final enteredTitle = _titleController.text;

    if(enteredTitle.isEmpty || _selectedImage == null){ return; }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();

  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              controller: _titleController,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground
              ),
            ),
            const SizedBox(height: 10,),
            ImageInput(onSelectImage: (File image)=> setState(() { _selectedImage = image; })),
            const SizedBox(height: 15,),
            const LocationInput(),

            const SizedBox(height: 15,),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            )
          ],
        ),
      ),
    );
  }
}
