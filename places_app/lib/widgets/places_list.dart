import 'package:flutter/material.dart';

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
            onTap: (){},
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
