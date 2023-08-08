class TopicsResponse {
  PayLoad? payLoad;
  int? code;
  String? res;

  TopicsResponse({this.payLoad, this.code, this.res});

  TopicsResponse.fromJson(Map<String, dynamic> json) {
    payLoad =
    json['PayLoad'] != null ? new PayLoad.fromJson(json['PayLoad']) : null;
    code = json['code'];
    res = json['res'];
  }

  get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payLoad != null) {
      data['PayLoad'] = this.payLoad!.toJson();
    }
    data['code'] = this.code;
    data['res'] = this.res;
    return data;
  }
}

class PayLoad {
  int? gptUserId;
  List<Topic>? topic;
  int? topicID;

  PayLoad({this.gptUserId, this.topic, this.topicID});

  PayLoad.fromJson(Map<String, dynamic> json) {
    gptUserId = json['Gpt_User_Id'];
    if (json['Topic'] != null) {
      topic = <Topic>[];
      json['Topic'].forEach((v) {
        topic!.add(new Topic.fromJson(v));
      });
    }
    topicID = json['Topic ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Gpt_User_Id'] = this.gptUserId;
    if (this.topic != null) {
      data['Topic'] = this.topic!.map((v) => v.toJson()).toList();
    }
    data['Topic ID'] = this.topicID;
    return data;
  }
}

class Topic {
  String? createdDate;
  int? gptUserId;
  String? topic;
  int? topicID;

  Topic({this.createdDate, this.gptUserId, this.topic, this.topicID});

  Topic.fromJson(Map<String, dynamic> json) {
    createdDate = json['Created_Date'];
    gptUserId = json['Gpt_User_Id'];
    topic = json['Topic'];
    topicID = json['Topic_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Created_Date'] = this.createdDate;
    data['Gpt_User_Id'] = this.gptUserId;
    data['Topic'] = this.topic;
    data['Topic_ID'] = this.topicID;
    return data;
  }
}
