import 'package:flutter/material.dart';

enum Product { dart, firebase, flutter }

class ProductCard extends StatelessWidget {
  final Product product;
  final String description;

  ProductCard({super.key, required this.product, required this.description});

  final Map<Product, String> images = {
    Product.dart: 'assets/images/dart.png',
    Product.firebase: 'assets/images/firebase.png',
    Product.flutter: 'assets/images/flutter.png',
  };

  final Map<Product, String> productNames = {
    Product.dart: 'Dart',
    Product.firebase: 'Firebase',
    Product.flutter: 'Flutter',
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        width: 500,
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
      
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Displaying image based on the product enum
              Image.asset(
                images[product]!,
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 10),
              // Displaying product name based on the enum
              Text(
                productNames[product]!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 5),
              // Displaying description
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ex2 extends StatelessWidget {
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ProductCard(
                product: Product.dart,
                description: 'The best Object language.',
              ),
              ProductCard(
                product: Product.flutter,
                description: 'The best Mobile widget library.',
              ),
              ProductCard(
                product: Product.firebase,
                description: 'The best cloud database.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

