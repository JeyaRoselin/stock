class EsgModel {
  String? symbol;
  String? companyName;
  double? environmentalScore;
  double? socialScore;
  double? governanceScore;
  double? totalEsgScore;
  String? industry;
  int? industryRank;
  String? sector;
  String? esgRiskRating;
  int? year;

  EsgModel(
      {this.symbol,
      this.companyName,
      this.environmentalScore,
      this.socialScore,
      this.governanceScore,
      this.totalEsgScore,
      this.industry,
      this.industryRank,
      this.sector,
      this.esgRiskRating,
      this.year});

  EsgModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    companyName = json['companyName'];
    environmentalScore = json['environmentalScore'];
    socialScore = json['socialScore'];
    governanceScore = json['governanceScore'];
    totalEsgScore = json['totalEsgScore'];
    industry = json['industry'];
    industryRank = json['industryRank'];
    sector = json['sector'];
    esgRiskRating = json['esgRiskRating'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['companyName'] = this.companyName;
    data['environmentalScore'] = this.environmentalScore;
    data['socialScore'] = this.socialScore;
    data['governanceScore'] = this.governanceScore;
    data['totalEsgScore'] = this.totalEsgScore;
    data['industry'] = this.industry;
    data['industryRank'] = this.industryRank;
    data['sector'] = this.sector;
    data['esgRiskRating'] = this.esgRiskRating;
    data['year'] = this.year;
    return data;
  }
}

