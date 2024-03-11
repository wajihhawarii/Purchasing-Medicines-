class CategoriesModel {
  String? idCategory;
  String? category;
  String? image;
  String? status;
  List<ProductModel>? product;

  CategoriesModel(
      {this.idCategory, this.category, this.image, this.status, this.product});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    idCategory = json['idCategory'];
    category = json['category'];
    image = json['image'];
    status = json['status'];
    if (json['product'] != null) {
      product = <ProductModel>[];
      json['product'].forEach((v) {
        product!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idCategory'] = idCategory;
    data['category'] = category;
    data['image'] = image;
    data['status'] = status;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  String? idProduct;
  String? idCategory;
  String? name;
  String? description;
  String? image;
  String? price;
  String? status;
  String? createdAt;

  ProductModel(
      {this.idProduct,
      this.idCategory,
      this.name,
      this.description,
      this.image,
      this.price,
      this.status,
      this.createdAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    idCategory = json['id_category'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_product'] = idProduct;
    data['id_category'] = idCategory;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
