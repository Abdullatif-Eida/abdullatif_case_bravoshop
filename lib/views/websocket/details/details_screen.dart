import 'package:abdullatifcase/models/prodcut.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: MediaQuery.of(context).size.height * 0.6,
        elevation: 0,
        snap: true,
        floating: true,
        stretch: true,
        backgroundColor: Colors.grey.shade50,
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
            ],
            background: Image.network(
              product.brandLogo,
              fit: BoxFit.contain,
            )),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(45),
            child: Transform.translate(
              offset: const Offset(0, 1),
              child: Container(
                height: 45,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                    child: Container(
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
              ),
            )),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        Container(
            height: MediaQuery.of(context).size.height * 0.55,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(product.productUrl));
                      },
                      child: Text(
                        product.website,
                        style: TextStyle(
                          color: Colors.orange.shade400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  height: 50,
                  elevation: 0,
                  splashColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.yellow[800],
                  child: const Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            ))
      ])),
    ]);
  }
}
