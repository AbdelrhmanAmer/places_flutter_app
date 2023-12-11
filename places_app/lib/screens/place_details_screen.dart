import 'package:flutter/material.dart';

import '../models/place.dart';
class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({
    super.key, 
    required this.place
  });
  
  final Place place;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
          place.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer
        ),
      ),),
      body: Center(
        child: Stack(
          children: [
            Image.file(
                place.image,
                fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            )
          ],
        )
      ),
    );
  }
}
