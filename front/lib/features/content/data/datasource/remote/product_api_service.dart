
import 'package:dio/dio.dart';
import 'package:front/core/constatns.dart';
import 'package:front/features/content/data/model/product_model.dart';
import 'package:retrofit/http.dart';

part 'product_api_service.g.dart';
@RestApi(baseUrl: baseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET("/getAllProduct")
  Future<ProductModel> getProductAllProducts(@Header('Authorization') String token);

  // @GET("/getAllProduct")
  // Future<ProductModel> getSomeProducts
}