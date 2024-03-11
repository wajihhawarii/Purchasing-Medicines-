class ApiLink {
  /////////////////////// pc address ////////////////////////////////
  static const String host = "http://192.168.184.25/medicin_app"; //1
/////////////////// auth link /////////////////////////////////////
  static const String registerpage = "$host/register_api.php/"; //2
  static const String loginpage = "$host/login_api.php/"; //3

  static const String totalcard = "$host/total_cart.php/?userID=";
  static const String updataquantity = "$host/update_quantity.php/";
  static const String totalprice = "$host/get_total_price.php/?userID=";
  static const String getproduct = "$host/get_product.php/";
  static const String getproductwithcategories =
      "$host/get_product_with_category.php/";
  static const String gethistory = "$host/get_history.php/?id_user=";

//////////////////// card link //////////////////////////////////////
  static const String getcard = "$host/get_cart.php/"; //
  static const String checkout = "$host/checkout.php/";
  static const String addcard = "$host/add_to_cart.php/";
}
