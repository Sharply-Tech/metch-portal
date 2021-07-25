import 'package:metch_portal/domain/model/instrument.dart';

class InstrumentRepository {
  static const _allInstruments = <Instrument>[
    Instrument(
        id: 1,
        market: Market.STOCKS,
        name: 'Microsoft',
        symbol: 'MSFT',
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/4rv205uBj5m6gfhXaGPybeGBbrNwG1vzcVr3w-PxWT_gzhaabzvUUGpXJYKBqRFB8CzjzufbjDCbrJeG3qwE9R7jNhw640W70d0vNUeCIRDPhOdEjM8Xm4XwMxsy9htMWqQm6g',
        price: 250.5),
    Instrument(
        id: 2,
        market: Market.STOCKS,
        name: 'Apple',
        symbol: 'AAPL',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/647px-Apple_logo_black.svg.png',
        price: 120.35),
    Instrument(
        id: 3,
        market: Market.STOCKS,
        name: 'Realty Income',
        symbol: 'O',
        imageUrl: 'https://companiesmarketcap.com/img/company-logos/256/O.png',
        price: 70.15),
    Instrument(
        id: 4,
        market: Market.COMMODITIES,
        name: 'Gold',
        symbol: 'XAUUSD',
        imageUrl:
            'https://e7.pngegg.com/pngimages/1009/850/png-clipart-gold-bar-bullion-gold-as-an-investment-carat-gold-gold-refining.png',
        price: 1805.95),
    Instrument(
        id: 5,
        market: Market.COMMODITIES,
        name: 'Silver',
        symbol: 'XAGUSD',
        imageUrl:
            'https://toppng.com/uploads/preview/silver-bar-11530960008o7hahfpgns.png',
        price: 24.55),
    Instrument(
        id: 6,
        market: Market.COMMODITIES,
        name: 'Bitcoin',
        symbol: 'BTC',
        imageUrl:
            'https://w7.pngwing.com/pngs/1018/698/png-transparent-bitcoin-cash-cryptocurrency-money-blockchain-election-flyers-text-orange-logo.png',
        price: 24.55)
  ];

  static List<Instrument> findAllByMarket(Market? market) {
    if (market == null) {
      return _allInstruments;
    }
    return _allInstruments
        .where((instrument) => instrument.market == market)
        .toList();
  }

  static List<Instrument> findAll() {
    return _allInstruments.toList();
  }
}
