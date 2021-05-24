class Email {
  List<String> mailto;
  String subject;
  bool ishtml;
  Client client;

  Email({this.mailto, this.subject, this.ishtml, this.client});

  Email.fromJson(Map<String, dynamic> json) {
    mailto = json['mailto'].cast<String>();
    subject = json['subject'];
    ishtml = json['ishtml'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mailto'] = this.mailto;
    data['subject'] = this.subject;
    data['ishtml'] = this.ishtml;
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    return data;
  }
}

class Client {
  String clientName;
  String clientEmail;
  String projectName;
  String projectDescription;

  Client(
      {this.clientName,
      this.clientEmail,
      this.projectName,
      this.projectDescription});

  Client.fromJson(Map<String, dynamic> json) {
    clientName = json['clientName'];
    clientEmail = json['clientEmail'];
    projectName = json['projectName'];
    projectDescription = json['projectDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientName'] = this.clientName;
    data['clientEmail'] = this.clientEmail;
    data['projectName'] = this.projectName;
    data['projectDescription'] = this.projectDescription;
    return data;
  }
}
