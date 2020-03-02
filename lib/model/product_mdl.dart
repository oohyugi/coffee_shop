abstract class ProductListItem {}

class HeadingItem implements ProductListItem {
  final String title;
  final int id;

  HeadingItem(this.title, this.id);
}

class ProductItem implements ProductListItem {
  final String name;
  final String price;
  final String img;

  ProductItem(this.name, this.price, this.img);
}

class CategoryItemMdl {
  final String name;
  final int id;

  CategoryItemMdl(this.name, this.id);
}

final listProduct = List<ProductListItem>.generate(
    50,
    (i) => i % 10 == 0
        ? HeadingItem("Category $i", i)
        : ProductItem("Caffè Latte $i", "Rp20.000", ""));


