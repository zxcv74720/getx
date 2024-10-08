class Airport {
  final int? id;
  final String? name;
  final String? code;
  final String? continent;
  final String? countryCode;
  final String? elevation;
  final String? gpsCode;
  final double? latitude;
  final double? longitude;
  final String? municipality;
  final String? regionCode;

  Airport({
    this.id,
    this.name,
    this.code,
    this.continent,
    this.countryCode,
    this.elevation,
    this.gpsCode,
    this.latitude,
    this.longitude,
    this.municipality,
    this.regionCode,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      continent: json['continent'] as String?,
      countryCode: json['country_code'] as String?,
      elevation: json['eievation'] as String?,
      gpsCode: json['gps_code'] as String?,
      latitude: json['latitude'] != null ? double.tryParse(json['latitude'].toString()) : null,
      longitude: json['longitude'] != null ? double.tryParse(json['longitude'].toString()) : null,
      municipality: json['municipality'] as String?,
      regionCode: json['region_code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'continent': continent,
      'country_code': countryCode,
      'eievation': elevation,
      'gps_code': gpsCode,
      'latitude': latitude,
      'longitude': longitude,
      'municipality': municipality,
      'region_code': regionCode,
    };
  }
}