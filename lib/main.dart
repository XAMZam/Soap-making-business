import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopcare',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopcare'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: const SoapCategories(),
    );
  }
}

class SoapCategories extends StatelessWidget {
  const SoapCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.8,
      ),
      itemCount: organicSoapCategories.length,
      itemBuilder: (BuildContext context, int index) {
        final Map<String, dynamic> category = organicSoapCategories[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SoapProducts(category: category),
              ),
            );
          },
          child: Card(
            elevation: 3.0,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    category['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category['name']!,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


class SoapProducts extends StatelessWidget {
  final Map<String, dynamic> category;

  const SoapProducts({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category['name']!),
      ),
      body: ListView.builder(
        itemCount: (category['products'] as List<dynamic>).length,
        itemBuilder: (context, index) {
          final product = (category['products'] as List<dynamic>)[index] as Map<String, String>;
          return ListTile(
            title: Text(product['name']!),
            subtitle: Text(product['description']!),
            trailing: Text(product['price']!),
            onTap: () {
              // Add the product to the cart
              _addToCart(context, product);
            },
          );
        },
      ),
    );
  }
}


  void _addToCart(BuildContext context, Map<String, String> product) {
    // Implement logic to add the product to the cart
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Item Added to Cart'),
          content: Text('${product['name']} has been added to your cart.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text('Shopping Cart Screen'),
      ),
    );
  }
}

// Organic Soap Categories and Products
List<Map<String, dynamic>> organicSoapCategories = [
  {
    'name': 'Bar Soaps',
    'image': 'https://tinyurl.com/5d5bwe8a',
    'products': [
      {'name': 'Lavender & Chamomile Bar Soap', 'price': '\$5.99', 'description': 'Relaxing blend of lavender and chamomile'},
      {'name': 'Peppermint & Eucalyptus Bar Soap', 'price': '\$5.99', 'description': 'Invigorating mix of peppermint and eucalyptus'},
      {'name': 'Citrus & Ginger Bar Soap', 'price': '\$5.99', 'description': 'Refreshing combination of citrus and ginger'},
      {'name': 'Rosemary & Mint Bar Soap', 'price': '\$5.99', 'description': 'Revitalizing blend of rosemary and mint'},
      {'name': 'Tea Tree & Lavender Bar Soap', 'price': '\$5.99', 'description': 'Cleansing synergy of tea tree and lavender'},
      {'name': 'Oatmeal & Honey Bar Soap', 'price': '\$5.99', 'description': 'Nourishing blend of oatmeal and honey'},
    ],
  },
  {
    'name': 'Liquid Soaps',
    'image': 'https://tinyurl.com/2y3hc96z',
    'products': [
      {'name': 'Lavender & Chamomile Liquid Soap', 'price': '\$8.99', 'description': 'Soothing lavender and chamomile infusion'},
      {'name': 'Peppermint & Eucalyptus Liquid Soap', 'price': '\$8.99', 'description': 'Cooling peppermint and eucalyptus blend'},
      {'name': 'Citrus & Ginger Liquid Soap', 'price': '\$8.99', 'description': 'Zesty citrus with a hint of ginger freshness'},
      {'name': 'Rosemary & Mint Liquid Soap', 'price': '\$8.99', 'description': 'Herbal rosemary complemented by refreshing mint'},
      {'name': 'Tea Tree & Lavender Liquid Soap', 'price': '\$8.99', 'description': 'Purifying tea tree combined with calming lavender'},
      {'name': 'Oatmeal & Honey Liquid Soap', 'price': '\$8.99', 'description': 'Gentle oatmeal and honey nourishment for the skin'},
    ],
  },
  {
    'name': 'Body Soaps',
    'image': 'https://tinyurl.com/4kvb6btp',
    'products': [
      {'name': 'Lavender & Chamomile Body Soap', 'price': '\$6.99', 'description': 'Calming lavender and chamomile for the body'},
      {'name': 'Peppermint & Eucalyptus Body Soap', 'price': '\$6.99', 'description': 'Refreshing peppermint and eucalyptus cleanse'},
      {'name': 'Citrus & Ginger Body Soap', 'price': '\$6.99', 'description': 'Revitalizing citrus and ginger rejuvenation'},
      {'name': 'Rosemary & Mint Body Soap', 'price': '\$6.99', 'description': 'Invigorating rosemary and mint for a refreshing feel'},
      {'name': 'Tea Tree & Lavender Body Soap', 'price': '\$6.99', 'description': 'Purifying tea tree with soothing lavender comfort'},
      {'name': 'Oatmeal & Honey Body Soap', 'price': '\$6.99', 'description': 'Nourishing oatmeal and honey for soft, supple skin'},
    ],
  },
  {
    'name': 'Face Cleanser',
    'image': 'https://tinyurl.com/3b5reu78',
    'products': [
      {'name': 'Lavender & Chamomile Face Cleanser', 'price': '\$12.99', 'description': 'Gentle cleansing with lavender and chamomile essence'},
      {'name': 'Peppermint & Eucalyptus Face Cleanser', 'price': '\$12.99', 'description': 'Refreshing face cleanse with peppermint and eucalyptus'},
      {'name': 'Citrus & Ginger Face Cleanser', 'price': '\$12.99', 'description': 'Revitalizing face wash infused with citrus and ginger'},
      {'name': 'Rosemary & Mint Face Cleanser', 'price': '\$12.99', 'description': 'Purifying face cleanser with rosemary and mint freshness'},
      {'name': 'Tea Tree & Lavender Face Cleanser', 'price': '\$12.99', 'description': 'Clarifying face wash with tea tree and lavender benefits'},
      {'name': 'Oatmeal & Honey Face Cleanser', 'price': '\$12.99', 'description': 'Soothing face cleanse with oatmeal and honey nourishment'},
    ],
  },
  {
    'name': 'Oils',
    'image': 'https://tinyurl.com/mbdc4nt9',
    'products': [
      {'name': 'Lavender & Chamomile Oil', 'price': '\$15.99', 'description': 'Relaxing massage oil infused with lavender and chamomile'},
      {'name': 'Peppermint & Eucalyptus Oil', 'price': '\$15.99', 'description': 'Cooling body oil enriched with peppermint and eucalyptus'},
      {'name': 'Citrus & Ginger Oil', 'price': '\$15.99', 'description': 'Invigorating essential oil blend with citrus and ginger zest'},
      {'name': 'Rosemary & Mint Oil', 'price': '\$15.99', 'description': 'Revitalizing aroma oil featuring rosemary and mint essence'},
      {'name': 'Tea Tree & Lavender Oil', 'price': '\$15.99', 'description': 'Purifying oil blend with tea tree and lavender benefits'},
      {'name': 'Oatmeal & Honey Oil', 'price': '\$15.99', 'description': 'Nourishing body oil with oatmeal and honey hydration'},
    ],
  },
  {
    'name': 'Scrubs',
    'image': 'https://tinyurl.com/56ketjmw',
    'products': [
      {'name': 'Lavender & Chamomile Body Scrub', 'price': '\$14.99', 'description': 'Gentle exfoliation with lavender and chamomile soothing'},
      {'name': 'Peppermint & Eucalyptus Body Scrub', 'price': '\$14.99', 'description': 'Refreshing scrub infused with peppermint and eucalyptus freshness'},
      {'name': 'Citrus & Ginger Body Scrub', 'price': '\$14.99', 'description': 'Revitalizing scrub featuring citrus and ginger rejuvenation'},
      {'name': 'Rosemary & Mint Body Scrub', 'price': '\$14.99', 'description': 'Invigorating scrub with rosemary and mint revitalization'},
      {'name': 'Tea Tree & Lavender Body Scrub', 'price': '\$14.99', 'description': 'Purifying scrub blended with tea tree and lavender comfort'},
      {'name': 'Oatmeal & Honey Body Scrub', 'price': '\$14.99', 'description': 'Nourishing scrub with oatmeal and honey hydration for soft skin'},
    ],
  },
  {
    'name': 'Shampoos',
    'image': 'https://tinyurl.com/4edk89yx',
    'products': [
      {'name': 'Lavender & Chamomile Shampoo', 'price': '\$10.99', 'description': 'Soothing shampoo with lavender and chamomile care'},
      {'name': 'Peppermint & Eucalyptus Shampoo', 'price': '\$10.99', 'description': 'Refreshing shampoo infused with peppermint and eucalyptus freshness'},
      {'name': 'Citrus & Ginger Shampoo', 'price': '\$10.99', 'description': 'Revitalizing shampoo featuring citrus and ginger rejuvenation'},
      {'name': 'Rosemary & Mint Shampoo', 'price': '\$10.99', 'description': 'Invigorating shampoo with rosemary and mint revitalization'},
      {'name': 'Tea Tree & Lavender Shampoo', 'price': '\$10.99', 'description': 'Purifying shampoo blended with tea tree and lavender comfort'},
      {'name': 'Oatmeal & Honey Shampoo', 'price': '\$10.99', 'description': 'Nourishing shampoo with oatmeal and honey hydration for soft hair'},
    ],
  },
];