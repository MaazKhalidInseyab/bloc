class ChatHistory {
  PayLoad? payLoad;
  int? code;
  List<Messages>? messages;
  String? res;

  ChatHistory({this.payLoad, this.code, this.messages, this.res});

  ChatHistory.fromJson(Map<String, dynamic> json) {
    payLoad =
    json['PayLoad'] != null ? new PayLoad.fromJson(json['PayLoad']) : null;
    code = json['code'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
    res = json['res'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payLoad != null) {
      data['PayLoad'] = this.payLoad!.toJson();
    }
    data['code'] = this.code;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['res'] = this.res;
    return data;
  }
}

class PayLoad {
  String? gptUserId;
  String? packageName;
  int? wordCount;
  int? wordLimit;

  PayLoad({this.gptUserId, this.packageName, this.wordCount, this.wordLimit});

  PayLoad.fromJson(Map<String, dynamic> json) {
    gptUserId = json['Gpt_User_Id'];
    packageName = json['Package_Name'];
    wordCount = json['Word_Count'];
    wordLimit = json['Word_Limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Gpt_User_Id'] = this.gptUserId;
    data['Package_Name'] = this.packageName;
    data['Word_Count'] = this.wordCount;
    data['Word_Limit'] = this.wordLimit;
    return data;
  }
}

class Messages {
  String? auditLog;
  String? auditLogResponse;
  String? contactNo;
  String? createdDate;
  int? gptAuditLogId;
  int? gptUserId;
  String? source;

  Messages(
      {this.auditLog,
        this.auditLogResponse,
        this.contactNo,
        this.createdDate,
        this.gptAuditLogId,
        this.gptUserId,
        this.source});

  Messages.fromJson(Map<String, dynamic> json) {
    auditLog = json['Audit_Log'];
    auditLogResponse = json['Audit_Log_Response'];
    contactNo = json['ContactNo'];
    createdDate = json['Created_Date'];
    gptAuditLogId = json['Gpt_AuditLog_Id'];
    gptUserId = json['Gpt_User_Id'];
    source = json['Source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Audit_Log'] = this.auditLog;
    data['Audit_Log_Response'] = this.auditLogResponse;
    data['ContactNo'] = this.contactNo;
    data['Created_Date'] = this.createdDate;
    data['Gpt_AuditLog_Id'] = this.gptAuditLogId;
    data['Gpt_User_Id'] = this.gptUserId;
    data['Source'] = this.source;
    return data;
  }
}
