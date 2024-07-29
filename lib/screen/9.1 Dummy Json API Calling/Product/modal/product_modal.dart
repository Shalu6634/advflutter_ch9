
class ProductModal {
  late List<Products> products;
  late int total, skip, limit;

  ProductModal({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModal.fromJson(Map m1) {
    return ProductModal(
      products: (m1['products'] as List)
          .map(
            (e) => Products.fromJson(e),
          )
          .toList(),
      total: m1['total'],
      skip: m1['skip'],
      limit: m1['limit'],
    );
  }
}

class Products {
  late String title, brand;
  late int price, stock, rating;
  late List images;
  late int id;

  Products({
    required this.images,
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.rating,
    required this.stock,
  });

  factory Products.fromJson(Map m1) {
    return Products(
      images: m1['images'],
      id: m1['id'],
      brand: m1['brand'],
      price: m1['price'],
      rating: m1['rating'],
      stock: m1['stock'],
      title: m1['title'],
    );
  }
}
