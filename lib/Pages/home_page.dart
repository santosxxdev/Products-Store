import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:splach_with_login_firebase/Pages/porduct_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String routName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBE8EA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Products"),
            SizedBox(width: 2),
            Text('Store', style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            if (kDebugMode) print('Error: ${snapshot.error}');
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final products = snapshot.data!.data["products"] as List;

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsPage(product: product),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              product["thumbnail"],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["title"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$${product["price"]}",
                                style: const TextStyle(color: Colors.green),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(product["rating"].toString()),
                                ],
                              ),
                              Text("Stock: ${product["stock"]}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data found"));
          }
        },
      ),
    );
  }

  Future<Response> getProducts() async {
    final dio = Dio();
    final response = await dio.get("https://dummyjson.com/products");
    return response;
  }
}
