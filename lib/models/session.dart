class Session{
  final String title;
  final DateTime time;
  final String venue;
  final String description;
  final Session parent;
  final bool isConsumable;

  Session({this.title, this.time, this.venue, this.description, this.parent, this.isConsumable = false});
}