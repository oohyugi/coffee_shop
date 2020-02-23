/// name : "cat1"
/// product : {"name":"prod1","img":"s"}

class CategoryMdl {
  final String name;
  final ProductMdl product;

  CategoryMdl(this.name, this.product);




  Map toJson() => {
    "name": name,
    "product": product,
  };
}

/// name : "prod1"
/// img : "s"

class ProductMdl {
  final String name;
  final String img;

  ProductMdl(this.name, this.img);



  Map toJson() => {
    "name": name,
    "img": img,
  };
}