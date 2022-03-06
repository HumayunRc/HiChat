import 'package:hichat/imports.dart';

@immutable
class StoryData {
  const StoryData({
    required this.name,
    required this.lastName,
    required this.url,
  });

  final String lastName;
  final String name;
  final String url;
}
