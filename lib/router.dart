import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/home_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deal_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/widgets/bottom_bar.dart';
import 'features/home/models/product.dart';
import 'features/product_details/screens/product_details_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (_)=>const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const AddProductScreen());
    case AdminScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const AdminScreen());
    case SearchScreen.routeName:
      var searchQuery = settings.arguments as String;
      return MaterialPageRoute(builder: (_)=> SearchScreen(searchQuery: searchQuery,));
    case ProductDetailsScreen.routeName:
      var product = settings.arguments as Product;
      print(product);
      return MaterialPageRoute(
        builder: (_) => ProductDetailsScreen(
          product: product,
        ),
      );
    case CategoryDealScreen.routeName:
      var category = settings.arguments as String;
      return MaterialPageRoute(builder: (_)=> CategoryDealScreen(category: category));
    default:
      return MaterialPageRoute(builder: (_)=>Scaffold(
        body: Center(
          child: Text("Screen does not exist"),
        ),
      ));

  }
}