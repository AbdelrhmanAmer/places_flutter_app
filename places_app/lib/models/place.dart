import 'package:uuid/uuid.dart';

const uuid = Uuid();
class Place{
  String id;
  final String title;

  Place({
    required this.title
  }): id = uuid.v4();
}