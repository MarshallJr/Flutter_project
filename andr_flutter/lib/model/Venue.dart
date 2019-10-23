class Venue
{
  //TODO INSERT PROPERTIES AND GETTERS/SETTERS
  final String name;
  final String address;
  final String city;
  final String state;
  final String category;

  Venue({this.name,this.address,this.city,this.state,this.category});

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      name: json["name"],
      address: json["location.address"],
      city: json["location.city"],
      state: json["location.state"],
      category: json["categories[0].name"],
    );
  }
}