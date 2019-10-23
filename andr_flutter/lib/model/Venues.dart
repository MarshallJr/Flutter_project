//final FoursquareResponse = foursquareResponseFromJson(jsonString);
//FoursquareResponse foursquareResponse(String str) => FoursquareResponse.fromJson(json.decode(str));

class FoursquareResponse {
  Response response;

  FoursquareResponse({this.response});

  factory FoursquareResponse.fromJson(Map<String,dynamic> json) {
    FoursquareResponse(response: Response.fromJson(json["response"]));
  }
}

class Response {
  List<Venue> venues;

  Response({this.venues});

  factory Response.fromJson(Map<String,dynamic> json) {
    venues: List<Venue>.from(json["venues"].map((x) => Venue.fromJson(x)))
  }
}

class Venue {
  String name;
  Location location;
  List<Category> categories;

  Venue({this.name,this.location,this.categories});

  factory Venue.fromJson(Map<String, dynamic> json) {
    Venue(name: json["name"],
      location: Location.fromJson(json["location"]),
      categories: List<Category>.from(json["catyegories"].map((x) => Category.fromJson(x))),)
  }
}

class Location {
  String address;
  String city;
  String state;
  String country;

  Location({this.address,this.city,this.state,this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    Location(address: json["address"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
    );
  }
}
class Category {
  String name;

  Category({this.name});

  factory Category.fromJson(Map<String,dynamic> json) {
    Category(
      name: json["name"],
    );
  }
}