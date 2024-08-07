///
///
/// Just a simple model classes.
///
/// But they have to be fromJson method.
///

// ignore_for_file: dangling_library_doc_comments

class CacheModel {
  CacheModel({required this.data, required this.isCached});

  factory CacheModel.fromJson(Map<String, dynamic> json) {
    return CacheModel(
      data: json['data'] as String,
      isCached: json['isCached'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'isCached': isCached,
    };
  }

  final String data;
  final bool isCached;
}

class OtherCacheModel {
  OtherCacheModel({required this.data, required this.isCached, required this.id});

  factory OtherCacheModel.fromJson(Map<String, dynamic> json) {
    return OtherCacheModel(
      id: json['id'] is int ? json['id'] as int : int.tryParse(json['id'].toString()) ?? 0,
      data: json['data'] as String,
      isCached: json['isCached'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'data': data,
      'isCached': isCached,
    };
  }

  final String data;
  final bool isCached;
  final int id;
}
