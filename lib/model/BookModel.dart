class BookModel {
  int id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deadline;
  int ownerId;
  Status status;
  int readerId;

  BookModel(
      this.id, this.title, this.createdAt, this.updatedAt, this.deadline, this.ownerId, this.status, this.readerId);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "deadLine": deadline,
      "ownerId": ownerId,
      "status": status,
      "readerId": readerId,
    };
  }

  static BookModel fromMap(Map<String, dynamic> map) {
    return BookModel(
      map["id"],
      map["title"],
      DateTime.tryParse(map["createdAt"] ?? ""),
      DateTime.tryParse(map["updatedAt"] ?? ""),
      DateTime.tryParse(map["deadLine"] ?? ""),
      map["ownerId"],
      Status.values.firstWhere((element) => element.toString() == "Status." + map["status"]),
      map["readerId"],
    );
  }
}

enum Status { AVAILABLE, TAKEN }
