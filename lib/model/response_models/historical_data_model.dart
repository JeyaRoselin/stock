class HistoricalDataModel {
	MetaData? metaData;
	TimeSeriesDaily? timeSeriesDaily;

	HistoricalDataModel({this.metaData, this.timeSeriesDaily});

	HistoricalDataModel.fromJson(Map<String, dynamic> json) {
		metaData = json['Meta Data'] != null ? new MetaData.fromJson(json['Meta Data']) : null;
		timeSeriesDaily = json['Time Series (Daily)'] != null ? new TimeSeriesDaily.fromJson(json['Time Series (Daily)']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.metaData != null) {
      data['Meta Data'] = this.metaData!.toJson();
    }
		if (this.timeSeriesDaily != null) {
      data['Time Series (Daily)'] = this.timeSeriesDaily!.toJson();
    }
		return data;
	}
}

class MetaData {
	String? s1Information;
	String? s2Symbol;
	String? s3LastRefreshed;
	String? s4OutputSize;
	String? s5TimeZone;

	MetaData({this.s1Information, this.s2Symbol, this.s3LastRefreshed, this.s4OutputSize, this.s5TimeZone});

	MetaData.fromJson(Map<String, dynamic> json) {
		s1Information = json['1. Information'];
		s2Symbol = json['2. Symbol'];
		s3LastRefreshed = json['3. Last Refreshed'];
		s4OutputSize = json['4. Output Size'];
		s5TimeZone = json['5. Time Zone'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['1. Information'] = this.s1Information;
		data['2. Symbol'] = this.s2Symbol;
		data['3. Last Refreshed'] = this.s3LastRefreshed;
		data['4. Output Size'] = this.s4OutputSize;
		data['5. Time Zone'] = this.s5TimeZone;
		return data;
	}
}

class TimeSeriesDaily {
  Map<String, TimeModel>? dailyData;

  TimeSeriesDaily({this.dailyData});

  TimeSeriesDaily.fromJson(Map<String, dynamic> json) {
    dailyData = {};
    json.forEach((key, value) {
      dailyData![key] = TimeModel.fromJson(value);
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    dailyData?.forEach((key, value) {
      data[key] = value.toJson();
    });
    return data;
  }
}


class TimeModel {
	String? s1Open;
	String? s2High;
	String? s3Low;
	String? s4Close;
	String? s5Volume;

	TimeModel({this.s1Open, this.s2High, this.s3Low, this.s4Close, this.s5Volume});

	TimeModel.fromJson(Map<String, dynamic> json) {
		s1Open = json['1. open'];
		s2High = json['2. high'];
		s3Low = json['3. low'];
		s4Close = json['4. close'];
		s5Volume = json['5. volume'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['1. open'] = this.s1Open;
		data['2. high'] = this.s2High;
		data['3. low'] = this.s3Low;
		data['4. close'] = this.s4Close;
		data['5. volume'] = this.s5Volume;
		return data;
	}
}

