import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places_app/models/place.dart';
import 'package:places_app/providers/user_places_provider.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:places_app/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Place> userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Your Places',
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlacesList( places: userPlaces, )),
    );
  }
}
