class CategoriesProductsModel {
  String? idProduct;
  String? idCategory;
  String? name;
  String? description;
  String? image;
  String? price;
  String? status;
  String? createdAt;

  CategoriesProductsModel(
      {this.idProduct,
      this.idCategory,
      this.name,
      this.description,
      this.image,
      this.price,
      this.status,
      this.createdAt});

  CategoriesProductsModel.fromJson(Map<String, dynamic> json) {
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
