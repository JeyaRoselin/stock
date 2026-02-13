class SearchSymbolModel {
  List<BestMatches>? bestMatches;

  SearchSymbolModel({this.bestMatches});

  SearchSymbolModel.fromJson(Map<String, dynamic> json) {
    if (json['bestMatches'] != null) {
      bestMatches = <BestMatches>[];
      json['bestMatches'].forEach((v) {
        bestMatches!.add(new BestMatches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bestMatches != null) {
      data['bestMatches'] = this.bestMatches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestMatches {
  String? s1Symbol;
  String? s2Name;
  String? s3Type;
  String? s4Region;
  String? s5MarketOpen;
  String? s6MarketClose;
  String? s7Timezone;
  String? s8Currency;
  String? s9MatchScore;

  double? amount;     
  double? quantity;    

  BestMatches({
    this.s1Symbol,
    this.s2Name,
    this.s3Type,
    this.s4Region,
    this.s5MarketOpen,
    this.s6MarketClose,
    this.s7Timezone,
    this.s8Currency,
    this.s9MatchScore,
    this.amount,
    this.quantity,
  });

  BestMatches.fromJson(Map<String, dynamic> json) {
    s1Symbol = json['1. symbol'];
    s2Name = json['2. name'];
    s3Type = json['3. type'];
    s4Region = json['4. region'];
    s5MarketOpen = json['5. marketOpen'];
    s6MarketClose = json['6. marketClose'];
    s7Timezone = json['7. timezone'];
    s8Currency = json['8. currency'];
    s9MatchScore = json['9. matchScore'];
    amount = json['amount'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      '1. symbol': s1Symbol,
      '2. name': s2Name,
      '3. type': s3Type,
      '4. region': s4Region,
      '5. marketOpen': s5MarketOpen,
      '6. marketClose': s6MarketClose,
      '7. timezone': s7Timezone,
      '8. currency': s8Currency,
      '9. matchScore': s9MatchScore,
      'amount': amount,
      'quantity': quantity,
    };
  }
}
