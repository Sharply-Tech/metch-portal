enum Market { STOCKS, COMMODITIES, CRYPTO }

class Instrument {
  const Instrument(
      {required this.id,
      required this.market,
      required this.name,
      required this.symbol,
      required this.imageUrl,
      required this.price});

  final int id;
  final Market market;
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
}
