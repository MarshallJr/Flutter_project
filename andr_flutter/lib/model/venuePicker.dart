import "package:andr_flutter/model/Venue.dart";
import "package:http/http.dart" as http;

class venuePicker
{
  String baseURL = "";

  /**
   *
   */
  static Set<Venue> fetchVenues()
  {
    return <Venue>{};
  }

  /**
   *
   */
  Future<http.Response> _getVenues()
  {
    return http.get(baseURL);
  }
}