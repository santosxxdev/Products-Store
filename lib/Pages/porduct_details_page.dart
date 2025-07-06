import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final darkColor = Colors.black87;
    final cardColor = Colors.white;
    final borderColor = Colors.grey[300];

    return Scaffold(
      backgroundColor: Color(0xFFDBE8EA),
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 2,
        title: Text(
          product["title"],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (product["images"] as List).length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product["images"][index],
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product["title"],
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product["description"],
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            _infoRow("Price", "\$${product["price"]}", color: Colors.green),
            _infoRow("Discount", "${product["discountPercentage"]}%"),
            _infoRow("Rating", "${product["rating"]} ⭐"),
            _infoRow("Stock", "${product["stock"]}"),
            _infoRow("Brand", "${product["brand"]}"),
            _infoRow("Category", "${product["category"]}"),
            _infoRow(
              "Shipping",
              product["shippingInformation"] ?? 'Not available',
            ),
            _infoRow(
              "Warranty",
              product["warrantyInformation"] ?? 'Not available',
            ),
            _infoRow("Return Policy", product["returnPolicy"] ?? 'N/A'),
            _infoRow(
              "Minimum Quantity",
              "${product["minimumOrderQuantity"] ?? 'N/A'}",
            ),
            _infoRow("Barcode", product["meta"]?["barcode"] ?? 'N/A'),
            _availabilityRow(product["availabilityStatus"]),
            const SizedBox(height: 24),
            const Text(
              "Tags:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List<Widget>.from(
                (product["tags"] as List).map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: darkColor, width: 1),
                    ),
                    child: Text(tag, style: const TextStyle(fontSize: 14)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (product["meta"]?["qrCode"] != null) ...[
              const Text(
                "QR Code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.network(product["meta"]["qrCode"], height: 140),
              ),
              const SizedBox(height: 30),
            ],
            if (product["reviews"] != null) ...[
              const Text(
                "Customer Reviews",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...List<Widget>.from(
                (product["reviews"] as List).map(
                  (review) => Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderColor!),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        Text(
                          review["reviewerName"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text("Rating: ${review["rating"]} ⭐"),
                        const SizedBox(height: 6),
                        Text(review["comment"]),
                        const SizedBox(height: 6),
                        Text(
                          "Date: ${review["date"].toString().split('T')[0]}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, {Color color = Colors.black87}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: 16, color: color)),
          ),
        ],
      ),
    );
  }

  Widget _availabilityRow(String? status) {
    final isAvailable = status == "In Stock";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Text(
            "Availability: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            status ?? "Unknown",
            style: TextStyle(
              fontSize: 16,
              color: isAvailable ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
