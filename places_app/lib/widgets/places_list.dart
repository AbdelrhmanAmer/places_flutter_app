import 'package:flutter/material.dart';
import 'package:places_app/screens/place_details_screen.dart';

import '../models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
    required this.places
  });

  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    Widget emptyPage = const Center(child: Text('sorry, there is no places.'),);

    return places.isEmpty
        ? emptyPage
        : ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index){
          return ListTile(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx){
                  return PlaceDetailsScreen(place: places[index]);
                })
              );
            },
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
              ),
            ),
          );
        }
    );
  }
}
