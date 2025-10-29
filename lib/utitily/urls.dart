class Urls {
  Urls._();
  static const String _baseUrl ='https://craftybay.teamrabbil.com/api';

  static String email (String email) => '$_baseUrl/UserLogin/$email';

  static String otp (String email,String otp) => '$_baseUrl/VerifyLogin/$email/$otp';

  static const String productSlider = '$_baseUrl/ListProductSlider';

  static const String productCategory= '$_baseUrl/ListProductByCategory';

  static  String productList (int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';

  static String getProductByRemarks (String remarks)=> '$_baseUrl/ListProductByRemark/$remarks';

  static String getProductDetails (int productId) => '$_baseUrl/ProductDetailsById/$productId';

  static const String addToCart = '$_baseUrl/CreateCartList';

  static const String cartList = '$_baseUrl/CartList';

  static const String createInvoice = '$_baseUrl/InvoiceCreate';

}