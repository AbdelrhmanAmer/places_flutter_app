import 'package:flutter/material.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:places_app/widgets/places_list.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx){
                    return const AddPlaceScreen();
                  })
                );
              },
              icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: const PlacesList( places: [ ], ),
    );
  }
}
