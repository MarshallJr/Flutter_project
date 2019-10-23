#Directory for view files

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Meta meta;
    Response response;

    Welcome({
        this.meta,
        this.response,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        meta: Meta.fromJson(json["meta"]),
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "response": response.toJson(),
    };
}

class Meta {
    int code;
    String requestId;

    Meta({
        this.code,
        this.requestId,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        requestId: json["requestId"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "requestId": requestId,
    };
}

class Response {
    List<Venue> venues;
    bool confident;
    Geocode geocode;

    Response({
        this.venues,
        this.confident,
        this.geocode,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        venues: List<Venue>.from(json["venues"].map((x) => Venue.fromJson(x))),
        confident: json["confident"],
        geocode: Geocode.fromJson(json["geocode"]),
    );

    Map<String, dynamic> toJson() => {
        "venues": List<dynamic>.from(venues.map((x) => x.toJson())),
        "confident": confident,
        "geocode": geocode.toJson(),
    };
}

class Geocode {
    String what;
    String where;
    Feature feature;
    List<dynamic> parents;

    Geocode({
        this.what,
        this.where,
        this.feature,
        this.parents,
    });

    factory Geocode.fromJson(Map<String, dynamic> json) => Geocode(
        what: json["what"],
        where: json["where"],
        feature: Feature.fromJson(json["feature"]),
        parents: List<dynamic>.from(json["parents"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "what": what,
        "where": where,
        "feature": feature.toJson(),
        "parents": List<dynamic>.from(parents.map((x) => x)),
    };
}

class Feature {
    String cc;
    String name;
    String displayName;
    String matchedName;
    String highlightedName;
    int woeType;
    String slug;
    String id;
    String longId;
    Geometry geometry;

    Feature({
        this.cc,
        this.name,
        this.displayName,
        this.matchedName,
        this.highlightedName,
        this.woeType,
        this.slug,
        this.id,
        this.longId,
        this.geometry,
    });

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        cc: json["cc"],
        name: json["name"],
        displayName: json["displayName"],
        matchedName: json["matchedName"],
        highlightedName: json["highlightedName"],
        woeType: json["woeType"],
        slug: json["slug"],
        id: json["id"],
        longId: json["longId"],
        geometry: Geometry.fromJson(json["geometry"]),
    );

    Map<String, dynamic> toJson() => {
        "cc": cc,
        "name": name,
        "displayName": displayName,
        "matchedName": matchedName,
        "highlightedName": highlightedName,
        "woeType": woeType,
        "slug": slug,
        "id": id,
        "longId": longId,
        "geometry": geometry.toJson(),
    };
}

class Geometry {
    Center center;
    Bounds bounds;

    Geometry({
        this.center,
        this.bounds,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        center: Center.fromJson(json["center"]),
        bounds: Bounds.fromJson(json["bounds"]),
    );

    Map<String, dynamic> toJson() => {
        "center": center.toJson(),
        "bounds": bounds.toJson(),
    };
}

class Bounds {
    Center ne;
    Center sw;

    Bounds({
        this.ne,
        this.sw,
    });

    factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        ne: Center.fromJson(json["ne"]),
        sw: Center.fromJson(json["sw"]),
    );

    Map<String, dynamic> toJson() => {
        "ne": ne.toJson(),
        "sw": sw.toJson(),
    };
}

class Center {
    double lat;
    double lng;

    Center({
        this.lat,
        this.lng,
    });

    factory Center.fromJson(Map<String, dynamic> json) => Center(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Venue {
    String id;
    String name;
    Contact contact;
    Location location;
    List<Category> categories;
    bool verified;
    Stats stats;
    BeenHere beenHere;
    HereNow hereNow;
    String referralId;
    List<dynamic> venueChains;
    bool hasPerk;

    Venue({
        this.id,
        this.name,
        this.contact,
        this.location,
        this.categories,
        this.verified,
        this.stats,
        this.beenHere,
        this.hereNow,
        this.referralId,
        this.venueChains,
        this.hasPerk,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        contact: Contact.fromJson(json["contact"]),
        location: Location.fromJson(json["location"]),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        verified: json["verified"],
        stats: Stats.fromJson(json["stats"]),
        beenHere: BeenHere.fromJson(json["beenHere"]),
        hereNow: HereNow.fromJson(json["hereNow"]),
        referralId: json["referralId"],
        venueChains: List<dynamic>.from(json["venueChains"].map((x) => x)),
        hasPerk: json["hasPerk"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact": contact.toJson(),
        "location": location.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "verified": verified,
        "stats": stats.toJson(),
        "beenHere": beenHere.toJson(),
        "hereNow": hereNow.toJson(),
        "referralId": referralId,
        "venueChains": List<dynamic>.from(venueChains.map((x) => x)),
        "hasPerk": hasPerk,
    };
}

class BeenHere {
    int count;
    int lastCheckinExpiredAt;
    bool marked;
    int unconfirmedCount;

    BeenHere({
        this.count,
        this.lastCheckinExpiredAt,
        this.marked,
        this.unconfirmedCount,
    });

    factory BeenHere.fromJson(Map<String, dynamic> json) => BeenHere(
        count: json["count"],
        lastCheckinExpiredAt: json["lastCheckinExpiredAt"],
        marked: json["marked"],
        unconfirmedCount: json["unconfirmedCount"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "lastCheckinExpiredAt": lastCheckinExpiredAt,
        "marked": marked,
        "unconfirmedCount": unconfirmedCount,
    };
}

class Category {
    String id;
    String name;
    String pluralName;
    String shortName;
    Icon icon;
    bool primary;

    Category({
        this.id,
        this.name,
        this.pluralName,
        this.shortName,
        this.icon,
        this.primary,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        pluralName: json["pluralName"],
        shortName: json["shortName"],
        icon: Icon.fromJson(json["icon"]),
        primary: json["primary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pluralName": pluralName,
        "shortName": shortName,
        "icon": icon.toJson(),
        "primary": primary,
    };
}

class Icon {
    String prefix;
    String suffix;

    Icon({
        this.prefix,
        this.suffix,
    });

    factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        prefix: json["prefix"],
        suffix: json["suffix"],
    );

    Map<String, dynamic> toJson() => {
        "prefix": prefix,
        "suffix": suffix,
    };
}

class Contact {
    Contact();

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    );

    Map<String, dynamic> toJson() => {
    };
}

class HereNow {
    int count;
    String summary;
    List<dynamic> groups;

    HereNow({
        this.count,
        this.summary,
        this.groups,
    });

    factory HereNow.fromJson(Map<String, dynamic> json) => HereNow(
        count: json["count"],
        summary: json["summary"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "summary": summary,
        "groups": List<dynamic>.from(groups.map((x) => x)),
    };
}

class Location {
    String address;
    double lat;
    double lng;
    List<LabeledLatLng> labeledLatLngs;
    int distance;
    String postalCode;
    String cc;
    String city;
    String state;
    String country;
    List<String> formattedAddress;

    Location({
        this.address,
        this.lat,
        this.lng,
        this.labeledLatLngs,
        this.distance,
        this.postalCode,
        this.cc,
        this.city,
        this.state,
        this.country,
        this.formattedAddress,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        labeledLatLngs: List<LabeledLatLng>.from(json["labeledLatLngs"].map((x) => LabeledLatLng.fromJson(x))),
        distance: json["distance"],
        postalCode: json["postalCode"],
        cc: json["cc"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        formattedAddress: List<String>.from(json["formattedAddress"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "lat": lat,
        "lng": lng,
        "labeledLatLngs": List<dynamic>.from(labeledLatLngs.map((x) => x.toJson())),
        "distance": distance,
        "postalCode": postalCode,
        "cc": cc,
        "city": city,
        "state": state,
        "country": country,
        "formattedAddress": List<dynamic>.from(formattedAddress.map((x) => x)),
    };
}

class LabeledLatLng {
    String label;
    double lat;
    double lng;

    LabeledLatLng({
        this.label,
        this.lat,
        this.lng,
    });

    factory LabeledLatLng.fromJson(Map<String, dynamic> json) => LabeledLatLng(
        label: json["label"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "lat": lat,
        "lng": lng,
    };
}

class Stats {
    int tipCount;
    int usersCount;
    int checkinsCount;
    int visitsCount;

    Stats({
        this.tipCount,
        this.usersCount,
        this.checkinsCount,
        this.visitsCount,
    });

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        tipCount: json["tipCount"],
        usersCount: json["usersCount"],
        checkinsCount: json["checkinsCount"],
        visitsCount: json["visitsCount"],
    );

    Map<String, dynamic> toJson() => {
        "tipCount": tipCount,
        "usersCount": usersCount,
        "checkinsCount": checkinsCount,
        "visitsCount": visitsCount,
    };
}
