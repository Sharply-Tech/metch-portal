import 'product.dart';

class ProductsRepository {
  static const _allProducts = <Product>[
    Product(
      category: Category.accessories,
      id: 0,
      isFeatured: true,
      name: 'Vagabond sack',
      price: 120,
    ),
    Product(
      category: Category.accessories,
      id: 1,
      isFeatured: true,
      name: 'Stella sunglasses',
      price: 58,
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: false,
      name: 'Whitney belt',
      price: 35,
    ),
    Product(
      category: Category.accessories,
      id: 3,
      isFeatured: true,
      name: 'Garden strand',
      price: 98,
    ),
    Product(
      category: Category.accessories,
      id: 4,
      isFeatured: false,
      name: 'Strut earrings',
      price: 34,
    ),
    Product(
      category: Category.accessories,
      id: 5,
      isFeatured: false,
      name: 'Varsity socks',
      price: 12,
    ),
    Product(
      category: Category.accessories,
      id: 6,
      isFeatured: false,
      name: 'Weave keyring',
      price: 16,
    ),
    Product(
      category: Category.accessories,
      id: 7,
      isFeatured: true,
      name: 'Gatsby hat',
      price: 40,
    ),
    Product(
      category: Category.accessories,
      id: 8,
      isFeatured: true,
      name: 'Shrug bag',
      price: 198,
    ),
    Product(
      category: Category.home,
      id: 9,
      isFeatured: true,
      name: 'Gilt desk trio',
      price: 58,
    ),
    Product(
      category: Category.home,
      id: 10,
      isFeatured: false,
      name: 'Copper wire rack',
      price: 18,
    ),
    Product(
      category: Category.home,
      id: 11,
      isFeatured: false,
      name: 'Soothe ceramic set',
      price: 28,
    ),
    Product(
      category: Category.home,
      id: 12,
      isFeatured: false,
      name: 'Hurrahs tea set',
      price: 34,
    ),
    Product(
      category: Category.home,
      id: 13,
      isFeatured: true,
      name: 'Blue stone mug',
      price: 18,
    ),
    Product(
      category: Category.home,
      id: 14,
      isFeatured: true,
      name: 'Rainwater tray',
      price: 27,
    ),
    Product(
      category: Category.home,
      id: 15,
      isFeatured: true,
      name: 'Chambray napkins',
      price: 16,
    ),
    Product(
      category: Category.home,
      id: 16,
      isFeatured: true,
      name: 'Succulent planters',
      price: 16,
    ),
    Product(
      category: Category.home,
      id: 17,
      isFeatured: false,
      name: 'Quartet table',
      price: 175,
    ),
    Product(
      category: Category.home,
      id: 18,
      isFeatured: true,
      name: 'Kitchen quattro',
      price: 129,
    ),
  ];

  static List<Product> loadProducts(Category category) {
    if (category == Category.all) {
      return _allProducts;
    } else {
      return _allProducts.where((p) => p.category == category).toList();
    }
  }
}