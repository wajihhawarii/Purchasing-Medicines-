class CardModel {
  String? idCart;
  String? quantity;
  String? name;
  String? image;
  String? price;

  CardModel({this.idCart, this.quantity, this.name, this.image, this.price});

  CardModel.fromJson(Map<String, dynamic> json) {
    idCart = json['id_cart'];
    quantity = json['quantity'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_cart'] = idCart;
    data['quantity'] = quantity;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    return data;
  }
}
