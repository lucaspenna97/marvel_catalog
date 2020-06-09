class MarvelComicResponse {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  Data data;

  MarvelComicResponse(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.etag,
      this.data});

  MarvelComicResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['attributionText'] = this.attributionText;
    data['attributionHTML'] = this.attributionHTML;
    data['etag'] = this.etag;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Results> results;

  Data({this.offset, this.limit, this.total, this.count, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  List<Prices> prices;
  Thumbnail thumbnail;

  Results(
      {this.id,
      this.digitalId,
      this.title,
      this.issueNumber,
      this.variantDescription,
      this.description,
      this.modified,
      this.isbn,
      this.upc,
      this.diamondCode,
      this.ean,
      this.issn,
      this.format,
      this.pageCount,
      this.prices,
      this.thumbnail});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'];
    description = json['description'];
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];
    if (json['prices'] != null) {
      prices = new List<Prices>();
      json['prices'].forEach((v) {
        prices.add(new Prices.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digitalId'] = this.digitalId;
    data['title'] = this.title;
    data['issueNumber'] = this.issueNumber;
    data['variantDescription'] = this.variantDescription;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['isbn'] = this.isbn;
    data['upc'] = this.upc;
    data['diamondCode'] = this.diamondCode;
    data['ean'] = this.ean;
    data['issn'] = this.issn;
    data['format'] = this.format;
    data['pageCount'] = this.pageCount;
    if (this.prices != null) {
      data['prices'] = this.prices.map((v) => v.toJson()).toList();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}

class Prices {
  String type;
  double price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = double.parse(json['price'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}

class Thumbnail {
  String path;
  String extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}
