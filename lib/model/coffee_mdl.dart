class MenuMdl {
  bool status;
  int httpCode;
  String message;
  List<MenuItemMdl> data;

  static MenuMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MenuMdl menuMdl = MenuMdl();
    menuMdl.status = map['status'];
    menuMdl.httpCode = map['http_code'];
    menuMdl.message = map['message'];
    menuMdl.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => MenuItemMdl.fromMap(o))
    );
    return menuMdl;
  }

  Map toJson() => {
    "status": status,
    "http_code": httpCode,
    "message": message,
    "data": data,
  };
}

class DataMenuMdl {
  int displayOrder;
  String name;
  List<MenuItemMdl> children;
  String id;
  String uri;

  static DataMenuMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataMenuMdl dataMenu = DataMenuMdl();
    dataMenu.displayOrder = map['displayOrder'];
    dataMenu.name = map['name'];
    dataMenu.children = List()..addAll(
      (map['children'] as List ?? []).map((o) => MenuItemMdl.fromMap(o))
    );
    dataMenu.id = map['id'];
    dataMenu.uri = map['uri'];
    return dataMenu;
  }

  Map toJson() => {
    "displayOrder": displayOrder,
    "name": name,
    "children": children,
    "id": id,
    "uri": uri,
  };
}

class MenuItemMdl {
  int displayOrder;
  String name;
  List<ProductsMdl> products;
  List<dynamic> children;
  String id;
  String uri;

  static MenuItemMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MenuItemMdl menuItemMdl = MenuItemMdl();
    menuItemMdl.displayOrder = map['displayOrder'];
    menuItemMdl.name = map['name'];
    menuItemMdl.products = List()..addAll(
      (map['products'] as List ?? []).map((o) => ProductsMdl.fromMap(o))
    );
    menuItemMdl.children = map['children'];
    menuItemMdl.id = map['id'];
    menuItemMdl.uri = map['uri'];
    return menuItemMdl;
  }

  Map toJson() => {
    "displayOrder": displayOrder,
    "name": name,
    "products": products,
    "children": children,
    "id": id,
    "uri": uri,
  };
}

class ProductsMdl {
  String name;
  String formCode;
  int displayOrder;
  int productNumber;
  String productType;
  String availability;
  AssetsMdl assets;
  List<SizesMdl> sizes;
  String uri;

  static ProductsMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ProductsMdl productsMdl = ProductsMdl();
    productsMdl.name = map['name'];
    productsMdl.formCode = map['formCode'];
    productsMdl.displayOrder = map['displayOrder'];
    productsMdl.productNumber = map['productNumber'];
    productsMdl.productType = map['productType'];
    productsMdl.availability = map['availability'];
    productsMdl.assets = AssetsMdl.fromMap(map['assets']);
    productsMdl.sizes = List()..addAll(
      (map['sizes'] as List ?? []).map((o) => SizesMdl.fromMap(o))
    );
    productsMdl.uri = map['uri'];
    return productsMdl;
  }

  Map toJson() => {
    "name": name,
    "formCode": formCode,
    "displayOrder": displayOrder,
    "productNumber": productNumber,
    "productType": productType,
    "availability": availability,
    "assets": assets,
    "sizes": sizes,
    "uri": uri,
  };
}

class SizesMdl {
  String sizeCode;

  static SizesMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SizesMdl sizesMdl = SizesMdl();
    sizesMdl.sizeCode = map['sizeCode'];
    return sizesMdl;
  }

  Map toJson() => {
    "sizeCode": sizeCode,
  };
}

class AssetsMdl {
  ThumbnailMdl thumbnail;
  FullSizeMdl fullSize;
  MasterImageMdl masterImage;

  static AssetsMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AssetsMdl assetsMdl = AssetsMdl();
    assetsMdl.thumbnail = ThumbnailMdl.fromMap(map['thumbnail']);
    assetsMdl.fullSize = FullSizeMdl.fromMap(map['fullSize']);
    assetsMdl.masterImage = MasterImageMdl.fromMap(map['masterImage']);
    return assetsMdl;
  }

  Map toJson() => {
    "thumbnail": thumbnail,
    "fullSize": fullSize,
    "masterImage": masterImage,
  };
}

class MasterImageMdl {
  String uri;

  static MasterImageMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MasterImageMdl masterImageMdl = MasterImageMdl();
    masterImageMdl.uri = map['uri'];
    return masterImageMdl;
  }

  Map toJson() => {
    "uri": uri,
  };
}

class FullSizeMdl {
  String uri;

  static FullSizeMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FullSizeMdl fullSizeMdl = FullSizeMdl();
    fullSizeMdl.uri = map['uri'];
    return fullSizeMdl;
  }

  Map toJson() => {
    "uri": uri,
  };
}

class ThumbnailMdl {
  LargeMdl large;

  static ThumbnailMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ThumbnailMdl thumbnailMdl = ThumbnailMdl();
    thumbnailMdl.large = LargeMdl.fromMap(map['large']);
    return thumbnailMdl;
  }

  Map toJson() => {
    "large": large,
  };
}

class LargeMdl {
  String uri;

  static LargeMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LargeMdl largeMdl = LargeMdl();
    largeMdl.uri = map['uri'];
    return largeMdl;
  }

  Map toJson() => {
    "uri": uri,
  };
}