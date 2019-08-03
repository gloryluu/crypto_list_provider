class Crypto {
    String id;
    String symbol;
    String name;
    String blockTimeInMinutes;
    Image image;
    MarketData marketData;
    DateTime lastUpdated;
    Localization localization;

    Crypto({
        this.id,
        this.symbol,
        this.name,
        this.blockTimeInMinutes,
        this.image,
        this.marketData,
        this.lastUpdated,
        this.localization,
    });

    factory Crypto.fromJson(Map<String, dynamic> json) => new Crypto(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        blockTimeInMinutes: json["block_time_in_minutes"] == null ? null : json["block_time_in_minutes"],
        image: Image.fromJson(json["image"]),
        marketData: MarketData.fromJson(json["market_data"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        localization: Localization.fromJson(json["localization"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "block_time_in_minutes": blockTimeInMinutes == null ? null : blockTimeInMinutes,
        "image": image.toJson(),
        "market_data": marketData.toJson(),
        "last_updated": lastUpdated.toIso8601String(),
        "localization": localization.toJson(),
    };
}

class Image {
    String thumb;
    String small;
    String large;

    Image({
        this.thumb,
        this.small,
        this.large,
    });

    factory Image.fromJson(Map<String, dynamic> json) => new Image(
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "small": small,
        "large": large,
    };
}

class Localization {
    String en;
    String es;
    String de;
    String nl;
    String pt;
    String fr;
    String it;
    String hu;
    String ro;
    String sv;
    String pl;
    String id;
    String zh;
    String zhTw;
    String ja;
    String ko;
    String ru;
    String ar;
    String th;
    String vi;
    String tr;

    Localization({
        this.en,
        this.es,
        this.de,
        this.nl,
        this.pt,
        this.fr,
        this.it,
        this.hu,
        this.ro,
        this.sv,
        this.pl,
        this.id,
        this.zh,
        this.zhTw,
        this.ja,
        this.ko,
        this.ru,
        this.ar,
        this.th,
        this.vi,
        this.tr,
    });

    factory Localization.fromJson(Map<String, dynamic> json) => new Localization(
        en: json["en"],
        es: json["es"],
        de: json["de"],
        nl: json["nl"],
        pt: json["pt"],
        fr: json["fr"],
        it: json["it"],
        hu: json["hu"],
        ro: json["ro"],
        sv: json["sv"],
        pl: json["pl"],
        id: json["id"],
        zh: json["zh"],
        zhTw: json["zh-tw"],
        ja: json["ja"],
        ko: json["ko"],
        ru: json["ru"],
        ar: json["ar"],
        th: json["th"],
        vi: json["vi"],
        tr: json["tr"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "es": es,
        "de": de,
        "nl": nl,
        "pt": pt,
        "fr": fr,
        "it": it,
        "hu": hu,
        "ro": ro,
        "sv": sv,
        "pl": pl,
        "id": id,
        "zh": zh,
        "zh-tw": zhTw,
        "ja": ja,
        "ko": ko,
        "ru": ru,
        "ar": ar,
        "th": th,
        "vi": vi,
        "tr": tr,
    };
}

class MarketData {
    Map<String, double> currentPrice;
    Roi roi;
    Map<String, double> marketCap;
    int marketCapRank;
    Map<String, double> totalVolume;
    Map<String, double> high24H;
    Map<String, double> low24H;
    double priceChange24H;
    double priceChangePercentage24H;
    double priceChangePercentage7D;
    double priceChangePercentage14D;
    double priceChangePercentage30D;
    double priceChangePercentage60D;
    double priceChangePercentage200D;
    double priceChangePercentage1Y;
    double marketCapChange24H;
    double marketCapChangePercentage24H;
    Map<String, double> priceChange24HInCurrency;
    Map<String, double> priceChangePercentage1HInCurrency;
    Map<String, double> priceChangePercentage24HInCurrency;
    Map<String, double> priceChangePercentage7DInCurrency;
    Map<String, double> priceChangePercentage14DInCurrency;
    Map<String, double> priceChangePercentage30DInCurrency;
    Map<String, double> priceChangePercentage60DInCurrency;
    Map<String, double> priceChangePercentage200DInCurrency;
    Map<String, double> priceChangePercentage1YInCurrency;
    Map<String, double> marketCapChange24HInCurrency;
    Map<String, double> marketCapChangePercentage24HInCurrency;
    int totalSupply;
    String circulatingSupply;

    MarketData({
        this.currentPrice,
        this.roi,
        this.marketCap,
        this.marketCapRank,
        this.totalVolume,
        this.high24H,
        this.low24H,
        this.priceChange24H,
        this.priceChangePercentage24H,
        this.priceChangePercentage7D,
        this.priceChangePercentage14D,
        this.priceChangePercentage30D,
        this.priceChangePercentage60D,
        this.priceChangePercentage200D,
        this.priceChangePercentage1Y,
        this.marketCapChange24H,
        this.marketCapChangePercentage24H,
        this.priceChange24HInCurrency,
        this.priceChangePercentage1HInCurrency,
        this.priceChangePercentage24HInCurrency,
        this.priceChangePercentage7DInCurrency,
        this.priceChangePercentage14DInCurrency,
        this.priceChangePercentage30DInCurrency,
        this.priceChangePercentage60DInCurrency,
        this.priceChangePercentage200DInCurrency,
        this.priceChangePercentage1YInCurrency,
        this.marketCapChange24HInCurrency,
        this.marketCapChangePercentage24HInCurrency,
        this.totalSupply,
        this.circulatingSupply,
    });

    factory MarketData.fromJson(Map<String, dynamic> json) => new MarketData(
        currentPrice: new Map.from(json["current_price"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        roi: json["roi"] == null ? null : Roi.fromJson(json["roi"]),
        marketCap: new Map.from(json["market_cap"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        marketCapRank: json["market_cap_rank"],
        totalVolume: new Map.from(json["total_volume"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        high24H: new Map.from(json["high_24h"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        low24H: new Map.from(json["low_24h"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H: json["price_change_percentage_24h"].toDouble(),
        priceChangePercentage7D: json["price_change_percentage_7d"].toDouble(),
        priceChangePercentage14D: json["price_change_percentage_14d"].toDouble(),
        priceChangePercentage30D: json["price_change_percentage_30d"].toDouble(),
        priceChangePercentage60D: json["price_change_percentage_60d"].toDouble(),
        priceChangePercentage200D: json["price_change_percentage_200d"].toDouble(),
        priceChangePercentage1Y: json["price_change_percentage_1y"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H: json["market_cap_change_percentage_24h"].toDouble(),
        priceChange24HInCurrency: new Map.from(json["price_change_24h_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1HInCurrency: new Map.from(json["price_change_percentage_1h_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage24HInCurrency: new Map.from(json["price_change_percentage_24h_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage7DInCurrency: new Map.from(json["price_change_percentage_7d_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage14DInCurrency: new Map.from(json["price_change_percentage_14d_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage30DInCurrency: new Map.from(json["price_change_percentage_30d_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage60DInCurrency: new Map.from(json["price_change_percentage_60d_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage200DInCurrency: new Map.from(json["price_change_percentage_200d_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1YInCurrency: new Map.from(json["price_change_percentage_1y_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        marketCapChange24HInCurrency: new Map.from(json["market_cap_change_24h_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        marketCapChangePercentage24HInCurrency: new Map.from(json["market_cap_change_percentage_24h_in_currency"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        totalSupply: json["total_supply"] == null ? null : json["total_supply"],
        circulatingSupply: json["circulating_supply"],
    );

    Map<String, dynamic> toJson() => {
        "current_price": new Map.from(currentPrice).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "roi": roi == null ? null : roi.toJson(),
        "market_cap": new Map.from(marketCap).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "market_cap_rank": marketCapRank,
        "total_volume": new Map.from(totalVolume).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "high_24h": new Map.from(high24H).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "low_24h": new Map.from(low24H).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "price_change_percentage_7d": priceChangePercentage7D,
        "price_change_percentage_14d": priceChangePercentage14D,
        "price_change_percentage_30d": priceChangePercentage30D,
        "price_change_percentage_60d": priceChangePercentage60D,
        "price_change_percentage_200d": priceChangePercentage200D,
        "price_change_percentage_1y": priceChangePercentage1Y,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "price_change_24h_in_currency": new Map.from(priceChange24HInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1h_in_currency": new Map.from(priceChangePercentage1HInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_24h_in_currency": new Map.from(priceChangePercentage24HInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_7d_in_currency": new Map.from(priceChangePercentage7DInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_14d_in_currency": new Map.from(priceChangePercentage14DInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_30d_in_currency": new Map.from(priceChangePercentage30DInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_60d_in_currency": new Map.from(priceChangePercentage60DInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_200d_in_currency": new Map.from(priceChangePercentage200DInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1y_in_currency": new Map.from(priceChangePercentage1YInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "market_cap_change_24h_in_currency": new Map.from(marketCapChange24HInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "market_cap_change_percentage_24h_in_currency": new Map.from(marketCapChangePercentage24HInCurrency).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "total_supply": totalSupply == null ? null : totalSupply,
        "circulating_supply": circulatingSupply,
    };
}

class Roi {
    double times;
    Currency currency;
    double percentage;

    Roi({
        this.times,
        this.currency,
        this.percentage,
    });

    factory Roi.fromJson(Map<String, dynamic> json) => new Roi(
        times: json["times"].toDouble(),
        currency: currencyValues.map[json["currency"]],
        percentage: json["percentage"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "times": times,
        "currency": currencyValues.reverse[currency],
        "percentage": percentage,
    };
}

enum Currency { BTC, USD, ETH }

final currencyValues = new EnumValues({
    "btc": Currency.BTC,
    "eth": Currency.ETH,
    "usd": Currency.USD
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
