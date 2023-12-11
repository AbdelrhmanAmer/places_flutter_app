import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  Location? _pickedLocation;
  bool _isGettingLocation = false;

  void _getCurrentLocation()async{
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();

    setState(() {
      _isGettingLocation = false;
    });
    print(locationData.latitude.toString());
    print(locationData.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = _isGettingLocation
        ? const Center(child: CircularProgressIndicator(),)
        : Text(
      'No Location Chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
      ),
    );

    return Column(
      children: [
        Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(.3)
                )
            ),
            child:previewContent
        ),
        const SizedBox(height: 16,),
        Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: const Icon(Icons.location_on),
                label: const Text('Get current location.'),
            ),
            TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.map),
              label: const Text('Select on map'),
            )
        ],)
      ],
    );
  }
}
