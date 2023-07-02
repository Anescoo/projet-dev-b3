
import 'package:flutter/material.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/content/domain/entity/product.dart';
import 'package:front/features/content/domain/usecase/get_products.dart';
  final List<Product> Lproducts = [
    const Product(
        description: 'description1',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test1',
        price: 1,
        productId: "2e2b91a9-05fd-48fe-b95b-842ed7113764",
        productQuantity: 2),
    const Product(
        description: 'description2',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test2',
        price: 1,
        productId: "2e2b91a9-05fd-48fe-b95b-842ed7113764",
        productQuantity: 2),
    const Product(
        description: 'description3',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test3',
        price: 1,
        productId: "2e2b91a9-05fd-48fe-b95b-842ed7113764",
        productQuantity: 2),
    const Product(
        description: 'description4',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test4',
        price: 1,
        productId: "2e2b91a9-05fd-48fe-b95b-842ed7113764",
        productQuantity: 2),
    const Product(
        description: 'description5',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test5',
        price: 1,
        productId: "2e2b91a9-05fd-48fe-b95b-842ed7113764",
        productQuantity: 2),
    const Product(
        description: 'description6',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test6',
        price: 1,
        productId: "2e2b91a9-05fd-48fe-b95b-842ed7113764",
        productQuantity: 2),
    const Product(
        description: 'description7',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test7',
        price: 1,
        productId: "2e2b91a9-05fd-48fe-b95b-842ed7113764",
        productQuantity: 2),
    const Product(
        description: 'description8',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test8',
        price: 1,
        productId: "2e2b91a9-05fd-48fe-b95b-842ed7113764",
        productQuantity: 2),
  ];

class ProductState extends ChangeNotifier {
  final GetAllProduct contentUsecase;
  List<Product>  content = [];
  ProductState(this.contentUsecase);
  
  void getAllContent() async {
    DataState data = await contentUsecase();
    if (data.runtimeType == DataSuccess) {
      content = data.data as List<Product>;
      print(data.data[0].price);
    }
    notifyListeners();
  }
  List<Product> get getContent => content;
}