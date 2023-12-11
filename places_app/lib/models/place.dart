
import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();
class Place{
  String id;
  final File image;
  final String title;

  Place({
    required this.title,
    required this.image
  }): id = uuid.v4();
}