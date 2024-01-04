
import 'package:abdullatifcase/models/prodcut.dart';
import 'package:abdullatifcase/views/websocket/details/details_screen.dart';
import 'package:abdullatifcase/views/websocket/websocket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebsocketView extends StatelessWidget {
  const WebsocketView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WebsocketCubit()..connect(),
      child: BlocBuilder<WebsocketCubit, Map<String, dynamic>>(
        builder: (context, productData) {
          if (productData["error"] != null) {
            return Scaffold(body: Center(child: Text(productData["error"])));
          } else if (productData["data"] == null) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            Product product = Product.fromJson(productData["data"]);
            return Scaffold(body: ProductDetailsScreen(product: product));
          }
        },
      ),
    );
  }
}
