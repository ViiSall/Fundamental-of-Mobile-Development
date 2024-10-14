void main() {
  const pizzaPrices = {
    'pepperoni': 7.5,
    'vegetarian': 6.5,
    'margherita': 5.5,
  };

  const order = ['margherita', 'pepperoni', 'apple'];
  double total = 0;

  for (var orders in order) {
    if (pizzaPrices.containsKey(orders)) {
      double price = pizzaPrices[orders]!;
      print(price);
      total += price;
    } else {
      print(orders + " is not in the pizzaPrices");
    }
  }

  print("total: \$total");
}
