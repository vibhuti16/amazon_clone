import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';
import '../../../provider/user_provider.dart';

class HomeServices{

  Future<List<Product>> fetchCategoryProducts({required BuildContext context, required String category}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try{
      http.Response response = await http.get(Uri.parse("$uri/api/products?category=$category"), headers:  <String, String>{
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
}