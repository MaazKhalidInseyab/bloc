class PromptResponse {
  PayLoad? payLoad;
  int? code;
  String? res;

  PromptResponse({this.payLoad, this.code, this.res});

  PromptResponse.fromJson(Map<String, dynamic> json) {
    payLoad =
    json['PayLoad'] != null ? new PayLoad.fromJson(json['PayLoad']) : null;
    code = json['code'];
    res = json['res'];
  }

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
  String? auditLogAns;
  int? gptUserId;
  String? packageName;
  int? wordCount;
  int? wordLimit;

  PayLoad(
      {this.auditLogAns,
        this.gptUserId,
        this.packageName,
        this.wordCount,
        this.wordLimit});

  PayLoad.fromJson(Map<String, dynamic> json) {
    auditLogAns = json['Audit_Log_Ans'];
    gptUserId = json['Gpt_User_Id'];
    packageName = json['Package_Name'];
    wordCount = json['Word_Count'];
    wordLimit = json['Word_Limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Audit_Log_Ans'] = this.auditLogAns;
    data['Gpt_User_Id'] = this.gptUserId;
    data['Package_Name'] = this.packageName;
    data['Word_Count'] = this.wordCount;
    data['Word_Limit'] = this.wordLimit;
    return data;
  }
}
