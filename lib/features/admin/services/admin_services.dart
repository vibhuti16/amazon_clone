import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/models/product.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct(
      {required BuildContext context,
      required String name,
      required String description,
      required int price,
      required int quantity,
      required String category,
      required List<File> images,
      }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary =
          CloudinaryPublic("dke1skw60", "i9vrkggd", cache: false);
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(response.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price, id: '');

      http.Response res = await http.post(Uri.parse("$uri/admin/add-product"),
          headers: <String, String>{
            "Content-type": "application/json; charset=UTF-8",
            "x-auth-token": userProvider.user.token
          },
          body: product.toJson());

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(context, "Product added successfully");
            Navigator.pop(context, product);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  //get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async{
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try{
      http.Response response = await http.get(Uri.parse("$uri/admin/get-products"), headers:  <String, String>{
        "Content-type": "application/json; charset=UTF-8",
        "x-auth-token": userProvider.user.token
      },);
      httpErrorHandle(response: response, context: context, onSuccess: (){
        for(int i=0;i<jsonDecode(response.body).length;i++){
          productList.add(Product.fromJson(jsonEncode(jsonDecode(response.body)[i])));
        }
      });


    }catch(e){
      showSnackbar(context, e.toString());
    }
    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
